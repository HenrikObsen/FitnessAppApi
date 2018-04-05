using System;
using System.Collections.Generic;

namespace FitnessAppApi
{


	 public class ProgramFac:AutoFac<Program>
	 {
        SessionFac sf = new SessionFac();
        SessionItemFac sif = new SessionItemFac();

        public FullProgram GetFullProgram(int id)
        {
            FullProgram fp = new FullProgram();
            fp.program = Get(id);

            List<Sessiondetails> sdl = new List<Sessiondetails>();
            foreach (var item in sf.GetBy("ProgramID", id ,"Sorting"))
            {
                Sessiondetails sd = new Sessiondetails();
                sd.session = item;
                sd.sessionItems = sif.GetSessionItems(item.ID);

                sdl.Add(sd);
            }

            fp.sessionsDetails = sdl;

            return fp;

        }

     }

}
