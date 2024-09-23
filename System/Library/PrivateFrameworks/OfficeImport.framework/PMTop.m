@implementation PMTop

- (void)initializeClasses
{
  objc_super v3;

  objc_opt_class();
  objc_opt_class();
  v3.receiver = self;
  v3.super_class = (Class)PMTop;
  -[QLTop initializeClasses](&v3, sel_initializeClasses);
}

- (Class)readerClassForBinaryDocuments
{
  return (Class)objc_opt_class();
}

- (Class)readerClassForXMLDocuments
{
  return (Class)objc_opt_class();
}

- (void)readFile:(id)a3 orData:(id)a4 dataFileName:(id)a5 format:(unint64_t)a6 archiver:(id)a7 forIndexing:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  objc_super v18;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  objc_msgSend(v17, "setAutoCommit:", 0);
  v18.receiver = self;
  v18.super_class = (Class)PMTop;
  -[QLTop readFile:orData:dataFileName:format:archiver:forIndexing:](&v18, sel_readFile_orData_dataFileName_format_archiver_forIndexing_, v14, v15, v16, a6, v17, v8);

}

- (Class)mapperClassForIndexing:(BOOL)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isCancelled
{
  return 0;
}

+ (BOOL)supportsProgressiveMapping
{
  return 1;
}

@end
