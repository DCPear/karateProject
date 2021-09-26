package examples;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.junit5.Karate;

@KarateOptions( tags = {"@debug", "@regression", "@second"})
public class FeatureRunner {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
//    //add tags when not running through id
//    @Karate.Test
//    Karate testTags() {
//        return Karate.run().tags("@second").relativeTo(getClass());
//    }

}
