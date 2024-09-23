@implementation VUIPlistMediaLibraryIdentifier

- (VUIPlistMediaLibraryIdentifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (VUIPlistMediaLibraryIdentifier)initWithURL:(id)a3
{
  id v4;
  VUIPlistMediaLibraryIdentifier *v5;
  uint64_t v6;
  NSURL *libraryFileURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIPlistMediaLibraryIdentifier;
  v5 = -[VUIPlistMediaLibraryIdentifier init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    libraryFileURL = v5->_libraryFileURL;
    v5->_libraryFileURL = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)libraryFileURL
{
  return self->_libraryFileURL;
}

- (void)setLibraryFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFileURL, 0);
}

@end
