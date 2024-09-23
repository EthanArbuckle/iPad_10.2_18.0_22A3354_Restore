@implementation EMTop

- (Class)readerClassForBinaryDocuments
{
  return (Class)objc_opt_class();
}

- (Class)readerClassForXMLDocuments
{
  return (Class)objc_opt_class();
}

- (Class)stateClass
{
  return (Class)objc_opt_class();
}

- (Class)mapperClassForIndexing:(BOOL)a3
{
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)initializeClasses
{
  objc_super v3;

  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  objc_opt_class();
  v3.receiver = self;
  v3.super_class = (Class)EMTop;
  -[QLTop initializeClasses](&v3, sel_initializeClasses);
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
  v18.super_class = (Class)EMTop;
  -[QLTop readFile:orData:dataFileName:format:archiver:forIndexing:](&v18, sel_readFile_orData_dataFileName_format_archiver_forIndexing_, v14, v15, v16, a6, v17, v8);

}

+ (BOOL)supportsProgressiveMapping
{
  return 1;
}

- (void)readerDidStartDocument:(id)a3 withElementCount:(int64_t)a4
{
  id v6;
  void *v7;
  objc_super v8;

  v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)EMTop;
  -[QLTop readerDidStartDocument:withElementCount:](&v8, sel_readerDidStartDocument_withElementCount_, v6, a4);
  -[QLTop mapper](self, "mapper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setElementCount:", a4);

}

@end
