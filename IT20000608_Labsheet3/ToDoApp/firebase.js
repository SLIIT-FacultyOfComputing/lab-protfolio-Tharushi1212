// Import the functions you need from the SDKs you need
import { initializeApp } from 'firebase/app';
import { getAuth } from 'firebase/auth';
import { getFirestore } from 'firebase/firestore';

const firebaseConfig = {
  // Your Firebase project configuration goes here
  apiKey: 'AIzaSyAWXv_D8u26auSXxgKi7GkLUWYM00dbocQ',
  authDomain: 'ctsehotel.firebaseapp.com',
  projectId: 'ctsehotel',
  storageBucket: 'ctsehotel.appspot.com',
  messagingSenderId: '105914899438',
  appId: '1:105914899438:web:dbc218574148561bed8cff',
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);

// Initialize Firebase Authentication and get a reference to the service
const auth = getAuth(app);
const fireStoreDB = getFirestore(app);

export { auth, fireStoreDB };
