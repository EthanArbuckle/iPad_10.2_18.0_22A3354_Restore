@implementation BKLibraryRightsParser

- (BKLibraryRightsParser)init
{
  BKLibraryRightsParser *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *rightsInfo;
  NSMutableString *v5;
  NSMutableString *foundText;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryRightsParser;
  v2 = -[BKLibraryRightsParser init](&v8, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    rightsInfo = v2->_rightsInfo;
    v2->_rightsInfo = v3;

    v5 = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
    foundText = v2->_foundText;
    v2->_foundText = v5;

  }
  return v2;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  void *v9;
  id v10;

  v10 = a5;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("sinf"))
    && objc_msgSend(v10, "isEqualToString:", CFSTR("http://itunes.apple.com/ns/epub")))
  {
    -[BKLibraryRightsParser setRightsId:](self, "setRightsId:", 0);
    -[BKLibraryRightsParser setSinfData:](self, "setSinfData:", 0);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser foundText](self, "foundText"));
  objc_msgSend(v9, "setString:", &stru_C40E8);

}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser foundText](self, "foundText"));
  objc_msgSend(v6, "appendString:", v5);

}

- (void)parser:(id)a3 foundCDATA:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);

  if (objc_msgSend(v7, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser foundText](self, "foundText"));
    objc_msgSend(v6, "appendString:", v7);

  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a4;
  v8 = a5;
  if (objc_msgSend(v20, "isEqualToString:", CFSTR("sID"))
    && objc_msgSend(v8, "isEqualToString:", CFSTR("http://itunes.apple.com/ns/epub")))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser foundText](self, "foundText"));
    -[BKLibraryRightsParser setRightsId:](self, "setRightsId:", v9);

    goto LABEL_17;
  }
  if (!objc_msgSend(v20, "isEqualToString:", CFSTR("sData"))
    || !objc_msgSend(v8, "isEqualToString:", CFSTR("http://itunes.apple.com/ns/epub")))
  {
    if (!objc_msgSend(v20, "isEqualToString:", CFSTR("sinf"))
      || !objc_msgSend(v8, "isEqualToString:", CFSTR("http://itunes.apple.com/ns/epub")))
    {
      goto LABEL_17;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser rightsId](self, "rightsId"));
    if (objc_msgSend(v14, "length"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser sinfData](self, "sinfData"));
      v16 = objc_msgSend(v15, "length");

      if (!v16)
      {
LABEL_14:
        -[BKLibraryRightsParser setRightsId:](self, "setRightsId:", 0);
        -[BKLibraryRightsParser setSinfData:](self, "setSinfData:", 0);
        goto LABEL_17;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser sinfData](self, "sinfData"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser rightsInfo](self, "rightsInfo"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser rightsId](self, "rightsId"));
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, v18);

    }
    goto LABEL_14;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser foundText](self, "foundText"));
  if (objc_msgSend(v10, "length"))
  {
    v11 = objc_alloc((Class)NSData);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser foundText](self, "foundText"));
    v13 = objc_msgSend(v11, "initWithBase64EncodedString:options:", v12, 0);

  }
  else
  {
    v13 = 0;
  }

  -[BKLibraryRightsParser setSinfData:](self, "setSinfData:", v13);
LABEL_17:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryRightsParser foundText](self, "foundText"));
  objc_msgSend(v19, "setString:", &stru_C40E8);

}

- (NSMutableDictionary)rightsInfo
{
  return self->_rightsInfo;
}

- (void)setRightsInfo:(id)a3
{
  objc_storeStrong((id *)&self->_rightsInfo, a3);
}

- (NSData)sinfData
{
  return self->_sinfData;
}

- (void)setSinfData:(id)a3
{
  objc_storeStrong((id *)&self->_sinfData, a3);
}

- (NSString)rightsId
{
  return self->_rightsId;
}

- (void)setRightsId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableString)foundText
{
  return self->_foundText;
}

- (void)setFoundText:(id)a3
{
  objc_storeStrong((id *)&self->_foundText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foundText, 0);
  objc_storeStrong((id *)&self->_rightsId, 0);
  objc_storeStrong((id *)&self->_sinfData, 0);
  objc_storeStrong((id *)&self->_rightsInfo, 0);
}

@end
