@implementation WBSUniqueFilenameEnumerator

- (WBSUniqueFilenameEnumerator)init
{
  return -[WBSUniqueFilenameEnumerator initWithFilename:](self, "initWithFilename:", &stru_1E64A2498);
}

- (WBSUniqueFilenameEnumerator)initWithFilename:(id)a3
{
  id v4;
  WBSUniqueFilenameEnumerator *v5;
  uint64_t v6;
  NSString *filename;
  uint64_t v8;
  NSString *filenameWithoutExtension;
  uint64_t v10;
  NSString *pathExtension;
  WBSUniqueFilenameEnumerator *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSUniqueFilenameEnumerator;
  v5 = -[WBSUniqueFilenameEnumerator init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    filename = v5->_filename;
    v5->_filename = (NSString *)v6;

    -[NSString stringByDeletingPathExtension](v5->_filename, "stringByDeletingPathExtension");
    v8 = objc_claimAutoreleasedReturnValue();
    filenameWithoutExtension = v5->_filenameWithoutExtension;
    v5->_filenameWithoutExtension = (NSString *)v8;

    -[NSString substringFromIndex:](v5->_filename, "substringFromIndex:", -[NSString length](v5->_filenameWithoutExtension, "length"));
    v10 = objc_claimAutoreleasedReturnValue();
    pathExtension = v5->_pathExtension;
    v5->_pathExtension = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (id)nextObject
{
  unint64_t iteration;
  void *v3;
  unint64_t v4;
  NSString *filenameWithoutExtension;
  void *v6;

  iteration = self->_iteration;
  if (iteration <= 0x7FFFFFFE)
  {
    if (iteration)
    {
      v4 = iteration + 1;
      self->_iteration = v4;
      filenameWithoutExtension = self->_filenameWithoutExtension;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%zu%@"), v4, self->_pathExtension);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:](filenameWithoutExtension, "safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      self->_iteration = 1;
      -[NSString safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:](self->_filenameWithoutExtension, "safari_stringByTruncatingToMaximumFilenameLengthPreservingExtensionAndAppendingString:", self->_pathExtension);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (unint64_t)fileNumber
{
  if (self->_iteration >= 2)
    return self->_iteration;
  else
    return 0;
}

- (NSString)filename
{
  return self->_filename;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
  objc_storeStrong((id *)&self->_filenameWithoutExtension, 0);
}

@end
