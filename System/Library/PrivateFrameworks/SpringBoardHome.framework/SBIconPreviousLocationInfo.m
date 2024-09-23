@implementation SBIconPreviousLocationInfo

- (SBFolder)folder
{
  return (SBFolder *)objc_loadWeakRetained((id *)&self->_folder);
}

- (void)setFolder:(id)a3
{
  objc_storeWeak((id *)&self->_folder, a3);
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_destroyWeak((id *)&self->_folder);
}

@end
