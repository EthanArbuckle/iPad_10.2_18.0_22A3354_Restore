@implementation TSPData

+ (id)dataFromDocumentURI:(id)a3 context:(id)a4
{
  uint64_t v6;
  double v7;
  id v8;

  v6 = objc_opt_class(THDocumentRoot);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, objc_msgSend(a4, "documentRoot")).n128_u64[0];
  return objc_msgSend(objc_msgSend(v8, "bookDescription", v7), "dataForDocRelativePath:context:", a3, a4);
}

- (BOOL)typeConformsToImage
{
  return -[UTType conformsToType:](+[UTType typeWithIdentifier:](UTType, "typeWithIdentifier:", -[TSPData type](self, "type")), "conformsToType:", UTTypeImage);
}

@end
