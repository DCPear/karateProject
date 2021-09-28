package helpers;

import com.github.javafaker.Faker;

import java.util.Locale;

public class DataGenerator {

    public static String getFakeName(){
        Faker faker = new Faker();
        String fakeName = faker.name().firstName().toLowerCase();
        return fakeName;
    }
    public static String getRandomEmail(){
        Faker faker = new Faker();
        String email = faker.random().nextInt(0, 100) + "@test.com";
        return email;
    }

    //no static example
    public String nonStaticExample(){
        Faker faker = new Faker();
        String fullName = faker.name().fullName().toLowerCase();
        return fullName;
    }
}
