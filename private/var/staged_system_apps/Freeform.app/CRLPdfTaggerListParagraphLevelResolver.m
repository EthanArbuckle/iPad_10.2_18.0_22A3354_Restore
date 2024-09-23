@implementation CRLPdfTaggerListParagraphLevelResolver

- (int)tagType
{
  return 300;
}

- (int)levelOfCurrentParagraph:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLPdfTaggerParagraphLevelResolver tagger](self, "tagger"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topmostColumnContext"));

  v6 = objc_msgSend(v5, "paragraphEnumerator");
  v7 = sub_1001721A4((uint64_t)v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (+[CRLPdfTagger isHeadingStyle:headingIndex:](CRLPdfTagger, "isHeadingStyle:headingIndex:", v8, 0)
    || !sub_100172320((uint64_t)v6))
  {
    v9 = -1;
  }
  else
  {
    v9 = sub_1001722CC((uint64_t)v6);
    v10 = sub_1001722DC((uint64_t)v6);
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v10));
    *a3 = v11;

  }
  return v9;
}

- (BOOL)paragraphInfo:(id)a3 matchesParagraphInfo:(id)a4 level:(int)a5
{
  return a3 == a4;
}

@end
