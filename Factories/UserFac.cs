using System;
using System.Data.SqlClient;

namespace FitnessAppApi
{

	 public class UserFac:AutoFac<User>
	 {
        public User Login(string username, string password)
        {
            User u = new User();

            Mapper<User> mapper = new Mapper<User>();

            using (var CMD = new SqlCommand("select * from [User] where Username=@username and Password=@password", Conn.CreateConnection()))
            {
                CMD.Parameters.AddWithValue("@username", username);
                CMD.Parameters.AddWithValue("@password", password);

                var r = CMD.ExecuteReader();

                if (r.Read())
                {
                    u = mapper.Map(r);

                }

                r.Close();
                CMD.Connection.Close();
            }
            
            return u;

        }


	 }

}
