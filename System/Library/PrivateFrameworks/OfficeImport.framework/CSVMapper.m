@implementation CSVMapper

- (CSVMapper)initWithRows:(id)a3 fileName:(id)a4 columnCount:(unint64_t)a5 archiver:(id)a6
{
  id v11;
  id v12;
  id v13;
  CSVMapper *v14;
  CSVMapper *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CSVMapper;
  v14 = -[CMMapper init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->mRows, a3);
    objc_storeStrong((id *)&v15->super.mArchiver, a6);
    objc_storeStrong((id *)&v15->mFileName, a4);
    v15->mColumnCount = a5;
    objc_storeStrong((id *)&v15->mFileName, a4);
  }

  return v15;
}

- (void)mapAt:(id)a3 withState:(id)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  OIXMLElement *v13;
  unint64_t v14;
  __CFString *v15;
  const __CFString *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  void *v22;

  v20 = a3;
  v18 = a4;
  -[NSString lastPathComponent](self->mFileName, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[CMXmlUtils copyHeadElementWithTitle:](CMXmlUtils, "copyHeadElementWithTitle:", v7);

  objc_msgSend(v20, "addChild:", v8);
  +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 17, CFSTR("body\n{\nfont: 10px Verdana;\n}\ntable\n{\nborder-collapse: collapse;\n}\ntd\n{\nfont-family:Verdana,Arial;\nfont-size:10;\nborder: solid 1px;\npadding: 5px;\nwhite-space:nowrap;\nborder-color: #DDDDDD;\n}\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", 0x24F3DF6B8, 0x24F3E6838);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAttribute:", v10);

  objc_msgSend(v20, "addChild:", v9);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addChild:", v19);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v8;
  v22 = v9;
  objc_msgSend(v19, "addChild:", v11);
  while (-[NSMutableArray count](self->mRows, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->mRows, "objectAtIndex:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[OIXMLElement initWithType:stringValue:]([OIXMLElement alloc], "initWithType:stringValue:", 21, 0);
    objc_msgSend(v11, "addChild:", v13);
    if (self->mColumnCount)
    {
      v14 = 0;
      do
      {
        if (v14 >= objc_msgSend(v12, "count"))
        {
          v15 = 0;
        }
        else
        {
          objc_msgSend(v12, "objectAtIndex:", v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        if (v15)
          v16 = v15;
        else
          v16 = &stru_24F3BFFF8;
        +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 19, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[OIXMLElement addChild:](v13, "addChild:", v17);

        ++v14;
      }
      while (v14 < self->mColumnCount);
    }
    -[NSMutableArray removeObjectAtIndex:](self->mRows, "removeObjectAtIndex:", 0);

    v8 = v21;
    v9 = v22;
  }

}

- (CGSize)pageSize
{
  double width;
  double height;
  CGSize result;

  width = self->mPageSize.width;
  height = self->mPageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFileName, 0);
  objc_storeStrong((id *)&self->mRows, 0);
}

@end
