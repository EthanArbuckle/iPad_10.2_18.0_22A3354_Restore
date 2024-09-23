@implementation OCBSummary

+ (void)readSummary:(id)a3 reader:(OcReader *)a4
{
  OcSummary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (OcSummary *)operator new(0x318uLL);
  OcSummary::OcSummary(v5);
  (*((void (**)(OcReader *, OcSummary *))a4->var0 + 4))(a4, v5);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)v5 + 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTitle:", v6);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)v5 + 104);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAuthor:", v7);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)v5 + 152);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setKeywords:", v8);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)v5 + 200);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setComments:", v9);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)v5 + 440);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHyperlinkBase:", v10);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)v5 + 56);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSubject:", v11);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithOcText:", (char *)v5 + 632);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setCompany:", v12);

  if (v5)
    (*(void (**)(OcSummary *))(*(_QWORD *)v5 + 8))(v5);

}

+ (void)writeSummary:(id)a3 writer:(OcWriter *)a4
{
  OcSummary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = (OcSummary *)operator new(0x318uLL);
  OcSummary::OcSummary(v5);
  objc_msgSend(v11, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "copyToOcText:encoding:", (char *)v5 + 8, 65001);

  objc_msgSend(v11, "author");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "copyToOcText:encoding:", (char *)v5 + 104, 65001);

  objc_msgSend(v11, "keywords");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "copyToOcText:encoding:", (char *)v5 + 152, 65001);

  objc_msgSend(v11, "comments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "copyToOcText:encoding:", (char *)v5 + 200, 65001);

  objc_msgSend(v11, "hyperlinkBase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "copyToOcText:encoding:", (char *)v5 + 440, 1252);

  (*((void (**)(OcWriter *, OcSummary *))a4->var0 + 2))(a4, v5);
  if (v5)
    (*(void (**)(OcSummary *))(*(_QWORD *)v5 + 8))(v5);

}

@end
