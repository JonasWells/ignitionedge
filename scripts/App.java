package com.example;

import java.io.IOException;

public class App {
    public static void main(String[] args) {
        try {
            // Call the shell script to modify the IP route table
            Process process = new ProcessBuilder("/scripts/netconfig.sh").start();
            process.waitFor();

            if (process.exitValue() != 0) {
                System.err.println("Failed to modify the IP route table.");
            }

            // Other JVM application logic goes here...

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
