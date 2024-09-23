@implementation CMXmlUtils

+ (id)copyXhtmlDocument
{
  void *v2;
  OIXMLDocument *v3;

  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[OIXMLDocument initWithRootElement:]([OIXMLDocument alloc], "initWithRootElement:", v2);
  -[OIXMLDocument setVersion:](v3, "setVersion:", CFSTR("1.0"));
  -[OIXMLDocument setCharacterEncoding:](v3, "setCharacterEncoding:", CFSTR("UTF-8"));

  return v3;
}

+ (id)copyHeadElementWithTitle:(id)a3 deviceWidth:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(a1, "copyHeadElementForDeviceWidth:", v4);
  if (v6)
  {
    +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 20, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addChild:", v8);

  }
  return v7;
}

+ (id)copyHeadElementForDeviceWidth:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_msgSend(a1, "copyHeadElement");
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("name"), CFSTR("viewport"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("width=%d, maximum-scale=4.0"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("content"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAttribute:", v8);

  objc_msgSend(v4, "addChild:", v5);
  return v4;
}

+ (id)copyHeadElement
{
  OIXMLElement *v2;
  void *v3;
  void *v4;

  v2 = -[OIXMLElement initWithType:stringValue:]([OIXMLElement alloc], "initWithType:stringValue:", 6, 0);
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("charset"), CFSTR("utf-8"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addAttribute:", v4);

  -[OIXMLElement addChild:](v2, "addChild:", v3);
  return v2;
}

+ (id)copyHeadElementWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "copyHeadElement");
  if (v4)
  {
    +[OIXMLElement elementWithType:stringValue:](OIXMLElement, "elementWithType:stringValue:", 20, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addChild:", v6);

  }
  +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[OIXMLAttribute attributeWithName:stringValue:](OIXMLAttribute, "attributeWithName:stringValue:", CFSTR("name"), CFSTR("viewport"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAttribute:", v8);

  objc_msgSend(v5, "addChild:", v7);
  return v5;
}

+ (id)copyFilteredString:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", v4);
  objc_msgSend(a1, "filterString:", v5);

  return v5;
}

+ (void)filterString:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  id v8;

  v3 = a3;
  v8 = v3;
  do
  {
    v4 = objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("  "), CFSTR(" &nbsp;"),
           2,
           0,
           objc_msgSend(v3, "length"));
    v3 = v8;
  }
  while (v4);
  v5 = objc_msgSend(v8, "length");
  if (v5)
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(v8, "characterAtIndex:", v6);
      if (v7 > 2027)
      {
        if (v7 == 2028)
        {
LABEL_12:
          objc_msgSend(v8, "replaceCharactersInRange:withString:", v6, 1, CFSTR("<br/>"));
          v5 += 4;
        }
        else if (v7 == 61607 || v7 == 61623)
        {
          objc_msgSend(v8, "replaceCharactersInRange:withString:", v6, 1, CFSTR("&bull;"));
          v5 += 5;
        }
      }
      else
      {
        switch(v7)
        {
          case 11:
          case 13:
            goto LABEL_12;
          case 12:
          case 14:
            objc_msgSend(v8, "replaceCharactersInRange:withString:", v6, 1, CFSTR(" "));
            break;
          default:
            break;
        }
      }
      ++v6;
    }
    while (v6 < v5);
  }

}

+ (id)xhtmlStringWithXmlData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t i;
  int v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithData:encoding:", v3, 4);
  while (objc_msgSend(v4, "replaceOccurrencesOfString:withString:options:range:", CFSTR("  "), CFSTR(" &nbsp;"),
            2,
            0,
            objc_msgSend(v4, "length")))
    ;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" &nbsp; &nbsp;"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "length");
  if (v6)
  {
    for (i = 0; i < v6; ++i)
    {
      v8 = objc_msgSend(v4, "characterAtIndex:", i);
      if (v8 > 2027)
      {
        if (v8 != 2028)
        {
          if (v8 == 61607 || v8 == 61623)
          {
            objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, CFSTR("&bull;"));
            v6 += 5;
          }
          continue;
        }
      }
      else if ((v8 - 10) >= 5)
      {
        if (v8 == 9)
        {
          objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, v5);
          v6 += 13;
        }
        continue;
      }
      objc_msgSend(v4, "replaceCharactersInRange:withString:", i, 1, CFSTR("<br/>"));
      v6 += 4;
    }
  }

  return v4;
}

@end
