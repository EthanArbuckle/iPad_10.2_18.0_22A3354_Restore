@implementation PRARKitDataRecorder

- (PRARKitDataRecorder)initWithARSession:(id)a3
{
  id v4;
  PRARKitDataRecorder *v5;
  PRARKitDataRecorder *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRARKitDataRecorder;
  v5 = -[PRDataRecorder init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PRARKitDataRecorder setSession:](v5, "setSession:", v4);

  return v6;
}

- (void)start
{
  void *v3;
  id v4;

  -[PRARKitDataRecorder stopAndDiscard](self, "stopAndDiscard");
  +[PRDataRecorder generateFilename](PRARKitDataRecorder, "generateFilename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRARKitDataRecorder setFilename:](self, "setFilename:", v3);

  +[PRDataRecorder generateTemporaryDirectoryURL](PRARKitDataRecorder, "generateTemporaryDirectoryURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PRARKitDataRecorder setFileURL:](self, "setFileURL:", v4);

}

- (id)stopAndSave
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[PRARKitDataRecorder filename](self, "filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.json"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRARKitDataRecorder fileURL](self, "fileURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PRDataRecorder writeSensorDataToURL:](self, "writeSensorDataToURL:", v7);
  -[PRARKitDataRecorder fileURL](self, "fileURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRARKitDataRecorder filename](self, "filename");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (ARSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
  objc_storeStrong((id *)&self->_filename, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
