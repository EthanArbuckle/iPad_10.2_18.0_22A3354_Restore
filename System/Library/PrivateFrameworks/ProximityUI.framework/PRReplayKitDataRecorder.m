@implementation PRReplayKitDataRecorder

- (PRReplayKitDataRecorder)init
{
  PRReplayKitDataRecorder *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PRReplayKitDataRecorder;
  v2 = -[PRDataRecorder init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDE81A0], "sharedRecorder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMicrophoneEnabled:", 0);

  }
  return v2;
}

- (void)start
{
  id v2;

  -[PRReplayKitDataRecorder stopAndDiscard](self, "stopAndDiscard");
  objc_msgSend(MEMORY[0x24BDE81A0], "sharedRecorder");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startRecordingWithHandler:", &__block_literal_global_2);

}

void __32__PRReplayKitDataRecorder_start__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  if (a2)
  {
    objc_msgSend(a2, "localizedDescription");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%@"), v2);

  }
}

- (id)stopAndSave
{
  void *v3;

  -[PRReplayKitDataRecorder writeToURL](self, "writeToURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRReplayKitDataRecorder stopAndDiscard](self, "stopAndDiscard");
  return v3;
}

- (void)stopAndDiscard
{
  -[PRReplayKitDataRecorder discardRecording](self, "discardRecording");
  -[PRDataRecorder discardSensorData](self, "discardSensorData");
}

- (id)writeToURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[PRDataRecorder generateFilename](PRReplayKitDataRecorder, "generateFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRDataRecorder generateTemporaryDirectoryURL](PRReplayKitDataRecorder, "generateTemporaryDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.json"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.mp4"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRReplayKitDataRecorder saveScreenRecordingToURL:](self, "saveScreenRecordingToURL:", v7);

  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRDataRecorder writeSensorDataToURL:](self, "writeSensorDataToURL:", v8);

  objc_msgSend(v4, "URLByAppendingPathComponent:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)saveScreenRecordingToURL:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDE81A0];
  v4 = a3;
  objc_msgSend(v3, "sharedRecorder");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopRecordingWithOutputURL:completionHandler:", v4, &__block_literal_global_8);

}

void __52__PRReplayKitDataRecorder_saveScreenRecordingToURL___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Screen Recording Error: %@"), a2);
}

- (void)discardRecording
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDE81A0], "sharedRecorder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopRecordingWithHandler:", &__block_literal_global_12);

  objc_msgSend(MEMORY[0x24BDE81A0], "sharedRecorder");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "discardRecordingWithHandler:", &__block_literal_global_14);

}

void __43__PRReplayKitDataRecorder_discardRecording__block_invoke_2()
{
  NSLog(CFSTR("Discarding recording"));
}

@end
