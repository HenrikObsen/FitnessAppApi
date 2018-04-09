using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace FitnessAppApi
{


	 public class SessionItemFac:AutoFac<SessionItem>
	 {

        public List<SessionItemDetails> GetSessionItems(int id)
        {
            List<SessionItemDetails> list = new List<SessionItemDetails>();

            using (var cmd = new SqlCommand("SELECT SessionItem.ID, SessionID, ExerciseID, Sets, Reps, Pause, Notes, MuscleGroupID, Name, Image, Video FROM SessionItem INNER JOIN Exercise ON SessionItem.ExerciseID = Exercise.ID WHERE SessionItem.SessionID=" + id, Conn.CreateConnection()))
            {
                Mapper<SessionItemDetails> mapper = new Mapper<SessionItemDetails>();

                list = mapper.MapList(cmd.ExecuteReader());
                cmd.Connection.Close();
                
            }

                return list;
        }


        public SessionItemDetails GetSessionItem(int id)
        {
            SessionItemDetails sid = new SessionItemDetails();

            using (var cmd = new SqlCommand("SELECT SessionItem.ID, SessionID, ExerciseID, Sets, Reps, Pause, Notes, MuscleGroupID, Name, Image, Video FROM SessionItem INNER JOIN Exercise ON SessionItem.ExerciseID = Exercise.ID WHERE SessionItem.ID=" + id, Conn.CreateConnection()))
            {
                var r = cmd.ExecuteReader();
              
                Mapper<SessionItemDetails> mapper = new Mapper<SessionItemDetails>();

                if (r.Read())
                {
                    sid = mapper.Map(r);
                }

                r.Close();
                cmd.Connection.Close();

            }

            return sid;
        }


    }

}
