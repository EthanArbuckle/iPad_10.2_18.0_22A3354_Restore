@implementation ICImportFolder

- (ICImportFolder)init
{
  ICImportFolder *v2;
  NSMutableArray *v3;
  NSMutableArray *fileURLs;
  NSMutableArray *v5;
  NSMutableArray *subFolders;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICImportFolder;
  v2 = -[ICImportFolder init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    fileURLs = v2->_fileURLs;
    v2->_fileURLs = v3;

    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    subFolders = v2->_subFolders;
    v2->_subFolders = v5;

  }
  return v2;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (ICFolder)folder
{
  return self->_folder;
}

- (void)setFolder:(id)a3
{
  objc_storeStrong((id *)&self->_folder, a3);
}

- (NSMutableArray)subFolders
{
  return self->_subFolders;
}

- (void)setSubFolders:(id)a3
{
  objc_storeStrong((id *)&self->_subFolders, a3);
}

- (NSMutableArray)fileURLs
{
  return self->_fileURLs;
}

- (void)setFileURLs:(id)a3
{
  objc_storeStrong((id *)&self->_fileURLs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLs, 0);
  objc_storeStrong((id *)&self->_subFolders, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
