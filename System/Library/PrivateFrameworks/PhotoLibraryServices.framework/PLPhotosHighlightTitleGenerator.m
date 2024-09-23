@implementation PLPhotosHighlightTitleGenerator

+ (id)titleForHighlight:(id)a3 filter:(unsigned __int16)a4 dateRangeTitleGenerator:(id)a5 options:(unint64_t)a6
{
  uint64_t v8;
  id v11;
  id v12;
  int v13;
  __objc2_class *v14;
  void *v15;
  void *v16;

  v8 = a4;
  v11 = a3;
  v12 = a5;
  if (objc_msgSend(a1, "canUseSharingComposition:forPhotosHighlightFilter:", objc_msgSend(v11, "sharingComposition"), v8))
  {
    if (objc_msgSend(v11, "sharingComposition") == 2)
      v8 = v8;
    else
      v8 = 0;
    v13 = objc_msgSend(v11, "kind");
    if ((v13 - 1) < 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotosHighlightTitleGenerator.m"), 153, CFSTR("Cannot call %s on highlight of this kind: %@"), "+[PLPhotosHighlightTitleGenerator titleForHighlight:filter:dateRangeTitleGenerator:options:]", v11);

    }
    else
    {
      if (v13 == 3)
      {
        v14 = PLDayGroupPhotosHighlightTitleGenerator;
        goto LABEL_12;
      }
      if (!v13)
      {
        v14 = PLDayPhotosHighlightTitleGenerator;
LABEL_12:
        -[__objc2_class titleForHighlight:filter:dateRangeTitleGenerator:options:](v14, "titleForHighlight:filter:dateRangeTitleGenerator:options:", v11, v8, v12, a6);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_13;
      }
    }
  }
  v16 = 0;
LABEL_13:

  return v16;
}

+ (BOOL)canUseSharingComposition:(signed __int16)a3 forPhotosHighlightFilter:(unsigned __int16)a4
{
  BOOL v4;

  v4 = (a3 & 0xFFFD) == 0;
  if (a4 != 1)
    v4 = 0;
  if (a4 == 2)
    v4 = (unsigned __int16)a3 - 1 < 2;
  return !a4 || v4;
}

@end
