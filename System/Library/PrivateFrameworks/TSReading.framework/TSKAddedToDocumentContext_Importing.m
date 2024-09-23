@implementation TSKAddedToDocumentContext_Importing

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKAddedToDocumentContext_Importing;
  -[TSKAddedToDocumentContext_Importing dealloc](&v3, sel_dealloc);
}

- (TSKAddedToDocumentContext_Importing)initWithImporterID:(id)a3
{
  TSKAddedToDocumentContext_Importing *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKAddedToDocumentContext_Importing;
  v4 = -[TSKAddedToDocumentContext_Importing init](&v6, sel_init);
  if (v4)
    v4->mImporterID = (NSString *)a3;
  return v4;
}

- (id)description
{
  return CFSTR("Imported");
}

- (id)importerID
{
  return self->mImporterID;
}

@end
