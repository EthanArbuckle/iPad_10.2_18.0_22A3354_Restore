@implementation EDContentFormatsCollection

- (EDContentFormatsCollection)init
{
  EDContentFormatsCollection *v2;
  EDContentFormatsCollection *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EDContentFormatsCollection;
  v2 = -[EDCollection init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mNextContentFormatId = 0;
    -[EDContentFormatsCollection setupDefaults](v2, "setupDefaults");
  }
  return v3;
}

- (void)setupDefaults
{
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("General"), 0);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("0"), 1);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("0.00"), 2);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("#,##0"), 3);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("#,##0.00"), 4);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("\"$\"#,##0_);\\(\"$\"#,##0\\)"),
    5);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("\"$\"#,##0_);[Red]\\(\"$\"#,##0\\)"),
    6);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("\"$\"#,##0.00_);\\(\"$\"#,##0.00\\)"),
    7);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("\"$\"#,##0.00_);[Red]\\(\"$\"#,##0.00\\)"),
    8);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("0%"), 9);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("0.00%"), 10);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("0.00E+00"), 11);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("# ?/?"), 12);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("# ??/??"), 13);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("m/d/yy"), 14);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("d-mmm-yy"), 15);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("d-mmm"), 16);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("mmm-yy"), 17);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("h:mm AM/PM"), 18);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("h:mm:ss AM/PM"), 19);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("h:mm"), 20);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("h:mm:ss"), 21);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("m/d/yy h:mm"), 22);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("m\"月\"d\"日\"yyyy\"年\"), 31);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("h\"時\"mm\"分\"), 32);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("h\"時\"mm\"分\"ss\"%秒\"), 33);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("#,##0_);\\(#,##0\\)"),
    37);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("#,##0_);[Red]\\(#,##0\\)"),
    38);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("#,##0.00_);\\(#,##0.00\\)"),
    39);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("#,##0.00_);[Red]\\(#,##0.00\\)"),
    40);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("_(* #,##0_);_(* \\(#,##0\\);_(* \"-\"_);_(@_)"),
    41);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("_(\"$\"* #,##0_);_(\"$\"* \\(#,##0\\);_(\"$\"* \"-\"_);_(@_)"),
    42);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("_(* #,##0.00_);_(* \\(#,##0.00\\);_(* \"-\"??_);_(@_)"),
    43);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("_(\"$\"* #,##0.00_);_(\"$\"* \\(#,##0.00\\);_(\"$\"* \"-\"??_);_(@_)"),
    44);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("mm:ss"), 45);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("[h]:mm:ss"), 46);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("mm:ss.0"), 47);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("##0.00E+0"), 48);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("@"), 49);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("yyyy\"年\"m\"月\"), 55);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("m\"月\"d\"日\"), 56);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("ge.m.d"), 57);
  -[EDContentFormatsCollection addDefaultWithNSString:formatId:](self, "addDefaultWithNSString:formatId:", CFSTR("ggge\"年\"m\"月\"d\"日\"), 58);
}

- (void)addDefaultWithNSString:(id)a3 formatId:(unint64_t)a4
{
  id v5;

  +[EDContentFormat contentFormatWithNSString:formatId:builtIn:](EDContentFormat, "contentFormatWithNSString:formatId:builtIn:", a3, a4, 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[EDContentFormatsCollection addObject:](self, "addObject:");
  objc_msgSend(v5, "setReferenced:", 0);

}

- (unint64_t)addObject:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t mNextContentFormatId;
  unint64_t v8;
  objc_super v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "formatId");
    mNextContentFormatId = self->mNextContentFormatId;
    if (v6 == -1)
    {
      self->mNextContentFormatId = mNextContentFormatId + 1;
      objc_msgSend(v5, "setFormatId:");
    }
    else if (v6 >= mNextContentFormatId)
    {
      self->mNextContentFormatId = v6 + 1;
    }
    v10.receiver = self;
    v10.super_class = (Class)EDContentFormatsCollection;
    v8 = -[EDKeyedCollection addObject:](&v10, sel_addObject_, v5);
    if (v8 != -1)
      objc_msgSend(v5, "setReferenced:", 1);
  }
  else
  {
    v8 = -1;
  }

  return v8;
}

- (unint64_t)addOrEquivalentObject:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "setReferenced:", 1);
  v7.receiver = self;
  v7.super_class = (Class)EDContentFormatsCollection;
  v5 = -[EDCollection addOrEquivalentObject:](&v7, sel_addOrEquivalentObject_, v4);

  return (unint64_t)v5;
}

- (BOOL)isOverwritingKeyOK
{
  return 1;
}

@end
