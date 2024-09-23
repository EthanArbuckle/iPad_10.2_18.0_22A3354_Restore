@implementation WMFieldMapper

- (WMFieldMapper)initWithWDFieldMarker:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  WMFieldMapper *v8;
  WMFieldMapper *v9;
  id *p_mParent;
  id WeakRetained;
  char isKindOfClass;
  id v13;
  uint64_t v14;
  OIXMLElement *mActiveNode;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *mLink;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WMFieldMapper;
  v8 = -[CMMapper initWithParent:](&v22, sel_initWithParent_, v7);
  v9 = v8;
  if (v8)
  {
    p_mParent = (id *)&v8->super.super.mParent;
    WeakRetained = objc_loadWeakRetained((id *)&v8->super.super.mParent);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v13 = objc_loadWeakRetained(p_mParent);
      objc_msgSend(v13, "activeNode");
      v14 = objc_claimAutoreleasedReturnValue();
      mActiveNode = v9->super.mActiveNode;
      v9->super.mActiveNode = (OIXMLElement *)v14;

    }
    else
    {
      v13 = v9->super.mActiveNode;
      v9->super.mActiveNode = 0;
    }

    *((_DWORD *)&v9->super.mIsDeleted + 1) = 1;
    v9->mMode = objc_msgSend(v6, "fieldType");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v6;
      if (objc_msgSend(v16, "internalLink"))
      {
        objc_msgSend(v16, "fragment");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v16, "fragment");
        else
          objc_msgSend(v16, "link");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v18)
          goto LABEL_14;
        v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("#%@"), v18);
      }
      else
      {
        objc_msgSend(v16, "link");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "copy");
      }
      mLink = v9->mLink;
      v9->mLink = (NSString *)v19;

LABEL_14:
    }
  }

  return v9;
}

- (void)mapFieldMarkerAt:(id)a3 marker:(id)a4 withState:(id)a5
{
  int v6;
  OIXMLElement *v7;
  OIXMLElement *mActiveNode;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *mLink;
  id v13;

  v13 = a4;
  v6 = objc_msgSend(v13, "fieldMarkerType");
  switch(v6)
  {
    case 21:
      if (self->mLink)
        goto LABEL_10;
      +[CMTextFilter filterHyperlinkField:](CMTextFilter, "filterHyperlinkField:", self->mMarkerText);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9 && (unint64_t)objc_msgSend(v9, "length") >= 3)
      {
        v11 = (NSString *)objc_msgSend(v10, "copy");
        mLink = self->mLink;
        self->mLink = v11;

      }
      if (self->mLink)
LABEL_10:
        -[CMMapper addAttribute:toNode:value:](self, "addAttribute:toNode:value:", 0x24F3E6C38, self->super.mActiveNode);
      break;
    case 20:
      *((_DWORD *)&self->super.mIsDeleted + 1) = 2;
      break;
    case 19:
      +[OIXMLElement elementWithType:](OIXMLElement, "elementWithType:", 0);
      v7 = (OIXMLElement *)objc_claimAutoreleasedReturnValue();
      -[OIXMLElement addChild:](self->super.mActiveNode, "addChild:", v7);
      mActiveNode = self->super.mActiveNode;
      self->super.mActiveNode = v7;

      break;
  }

}

- (void)mapRunAt:(id)a3 run:(id)a4 withState:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableString *v11;
  NSMutableString *mMarkerText;
  NSMutableString *v13;
  void *v14;
  NSMutableString *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (*((_DWORD *)&self->super.mIsDeleted + 1) != 2)
  {
    if (!self->mMarkerText)
    {
      v11 = (NSMutableString *)objc_alloc_init(MEMORY[0x24BDD16A8]);
      mMarkerText = self->mMarkerText;
      self->mMarkerText = v11;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = self->mMarkerText;
      objc_msgSend(v9, "string");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendString:](v13, "appendString:", v14);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_10;
      v15 = self->mMarkerText;
      objc_msgSend(v9, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableString appendString:](v15, "appendString:", v14);
    }

    goto LABEL_10;
  }
  v16.receiver = self;
  v16.super_class = (Class)WMFieldMapper;
  -[WMParagraphMapper mapRunAt:run:withState:](&v16, sel_mapRunAt_run_withState_, v8, v9, v10);
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mLink, 0);
  objc_storeStrong((id *)&self->mMarkerText, 0);
}

@end
