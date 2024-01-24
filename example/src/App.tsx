import React, { useState, useEffect } from 'react';
import {StyleSheet, View, BackHandler, Alert, Button} from 'react-native'
import ModuleUtility from 'react-native-module-utility';

export default function App() {
  const [backgroundTask, setBackgroundTask] = useState(0)
  
  const backAction = () => {
    Alert.alert("Hold on!", "Are you sure you want to go back?", [
      {
        text: "Cancel",
        onPress: () => null,
        style: "cancel"
      },
      { text: "YES", onPress: () => ModuleUtility.exitApp() }
    ]);
    return true;
  };

  useEffect(() => {
    BackHandler.addEventListener("hardwareBackPress", backAction);

    return () =>
      BackHandler.removeEventListener("hardwareBackPress", backAction);
  }, []);

  return (
    <View style={styles.container}>
      <Button title="앱종료" onPress={() => {
        backAction()
      }} />
      <Button title="Feedback" onPress={() => {
        ModuleUtility.feedback()
      }} />
      <Button title="테스크 시작" onPress={async () => {
        const task = await ModuleUtility.beginBackgroundTask()
        setBackgroundTask(task)
      }} />
      
      <Button title="테스크 종료" onPress={async () => {
        await ModuleUtility.endBackgroundTask(backgroundTask)
      }}/>

      <Button title="버전 확인" onPress={async () => {
        ModuleUtility.version().then((response) => {
          console.log(response)
        })
      }}/>

      <Button title="캡처 방지" onPress={async () => {
        ModuleUtility.activate().then((response) => {
          console.log(response)
        })
      }}/>
      <Button title="캡처 해제" onPress={async () => {
        ModuleUtility.deactivate().then((response) => {
          console.log(response)
        })
      }}/>
      <Button title="DeviceID" onPress={async () => {
        ModuleUtility.getDeviceId().then((response) => {
          console.log(response)
        })
      }}/>
      <Button title="ModelID" onPress={async () => {
        ModuleUtility.getModelId().then((response) => {
          console.log(response)
        })
      }}/>
      <Button title="OS" onPress={async () => {
        ModuleUtility.getOs().then((response) => {
          console.log(response)
        })
      }}/>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    width: 60,
    height: 60,
    marginVertical: 20,
  },
});