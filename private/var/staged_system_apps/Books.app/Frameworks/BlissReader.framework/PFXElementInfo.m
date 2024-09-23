@implementation PFXElementInfo

+ (void)elementInfos
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&qword_5433C8);
  if ((v2 & 1) == 0 && __cxa_guard_acquire(&qword_5433C8))
  {
    qword_5433C0 = 0;
    qword_5433B8 = 0;
    qword_5433B0 = (uint64_t)&qword_5433B8;
    __cxa_guard_release(&qword_5433C8);
  }
  return &qword_5433B0;
}

+ (void)addElementInfoForName:(const char *)a3 isBlockLevel:(BOOL)a4 ignoreContainedText:(BOOL)a5 denotesList:(BOOL)a6 denotesListItem:(BOOL)a7 isItsOwnParagraph:(BOOL)a8 isTableRelated:(BOOL)a9 hasTextAlign:(BOOL)a10
{
  _BOOL8 v10;
  _BOOL8 v11;
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  PFXElementInfo *v16;
  const xmlChar *v17;
  const xmlChar **v18;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v17 = (const xmlChar *)a3;
  v16 = objc_alloc_init(PFXElementInfo);
  -[PFXElementInfo setIsBlockLevel:](v16, "setIsBlockLevel:", v14);
  -[PFXElementInfo setIgnoreContainedText:](v16, "setIgnoreContainedText:", v13);
  -[PFXElementInfo setDenotesList:](v16, "setDenotesList:", v12);
  -[PFXElementInfo setDenotesListItem:](v16, "setDenotesListItem:", v11);
  -[PFXElementInfo setIsItsOwnParagraph:](v16, "setIsItsOwnParagraph:", v10);
  -[PFXElementInfo setIsTableRelated:](v16, "setIsTableRelated:", a9);
  -[PFXElementInfo setHasTextAlign:](v16, "setHasTextAlign:", a10);
  v18 = &v17;
  sub_1C6CDC((uint64_t **)objc_msgSend(a1, "elementInfos"), &v17, (uint64_t)&std::piecewise_construct, (uint64_t **)&v18)[5] = (uint64_t)v16;
}

+ (void)initialize
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  LOWORD(v3) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "a", 0, 0, 0, 0, 0, v3);
  LOWORD(v4) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "blockquote", 1, 0, 0, 0, 0, v4);
  LOWORD(v5) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "button", 0, 1, 0, 0, 0, v5);
  LOWORD(v6) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "body", 1, 0, 0, 0, 0, v6);
  LOWORD(v7) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "br", 0, 1, 0, 0, 0, v7);
  LOWORD(v8) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "center", 1, 0, 0, 0, 0, v8);
  LOWORD(v9) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "col", 1, 0, 0, 0, 0, v9);
  LOWORD(v10) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "colgroup", 1, 0, 0, 0, 0, v10);
  LOWORD(v11) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "dl", 1, 0, 1, 0, 0, v11);
  LOWORD(v12) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "dt", 1, 0, 0, 1, 0, v12);
  LOWORD(v13) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "dd", 1, 0, 0, 1, 0, v13);
  LOWORD(v14) = 256;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "div", 1, 0, 0, 0, 0, v14);
  LOWORD(v15) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "embed", 0, 1, 0, 0, 0, v15);
  LOWORD(v16) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "form", 1, 0, 0, 0, 0, v16);
  LOWORD(v17) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "iframe", 1, 1, 0, 0, 1, v17);
  LOWORD(v18) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "img", 0, 1, 0, 0, 0, v18);
  LOWORD(v19) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "input", 0, 1, 0, 0, 0, v19);
  LOWORD(v20) = 256;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "h1", 1, 0, 0, 0, 0, v20);
  LOWORD(v21) = 256;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "h2", 1, 0, 0, 0, 0, v21);
  LOWORD(v22) = 256;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "h3", 1, 0, 0, 0, 0, v22);
  LOWORD(v23) = 256;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "h4", 1, 0, 0, 0, 0, v23);
  LOWORD(v24) = 256;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "h5", 1, 0, 0, 0, 0, v24);
  LOWORD(v25) = 256;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "h6", 1, 0, 0, 0, 0, v25);
  LOWORD(v26) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "hr", 0, 1, 0, 0, 0, v26);
  LOWORD(v27) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "noscript", 1, 0, 0, 0, 0, v27);
  LOWORD(v28) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "option", 0, 1, 0, 0, 0, v28);
  LOWORD(v29) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "optgroup", 0, 1, 0, 0, 0, v29);
  LOWORD(v30) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "ol", 1, 0, 1, 0, 0, v30);
  LOWORD(v31) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "li", 1, 0, 0, 1, 0, v31);
  LOWORD(v32) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "object", 0, 1, 0, 0, 0, v32);
  LOWORD(v33) = 256;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "p", 1, 0, 0, 0, 0, v33);
  LOWORD(v34) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "pre", 1, 0, 0, 0, 0, v34);
  LOWORD(v35) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "script", 0, 1, 0, 0, 1, v35);
  LOWORD(v36) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "select", 0, 1, 0, 0, 0, v36);
  LOWORD(v37) = 1;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "table", 1, 1, 0, 0, 1, v37);
  LOWORD(v38) = 257;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "td", 1, 0, 0, 0, 0, v38);
  LOWORD(v39) = 1;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "tbody", 1, 0, 0, 0, 0, v39);
  LOWORD(v40) = 1;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "thead", 1, 0, 0, 0, 0, v40);
  LOWORD(v41) = 1;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "tfoot", 1, 0, 0, 0, 0, v41);
  LOWORD(v42) = 257;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "th", 1, 0, 0, 0, 0, v42);
  LOWORD(v43) = 257;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "tr", 1, 0, 0, 0, 0, v43);
  LOWORD(v44) = 0;
  objc_msgSend(a1, "addElementInfoForName:isBlockLevel:ignoreContainedText:denotesList:denotesListItem:isItsOwnParagraph:isTableRelated:hasTextAlign:", "ul", 1, 0, 1, 0, 0, v44);
}

+ (id)elementInfoForElement:(const char *)a3
{
  char *v3;
  uint64_t v4;
  const xmlChar *v6;

  v6 = (const xmlChar *)a3;
  v3 = (char *)objc_msgSend(a1, "elementInfos");
  v4 = sub_1C95FC((uint64_t)v3, &v6);
  if (v3 + 8 == (char *)v4)
    return 0;
  else
    return *(id *)(v4 + 40);
}

- (BOOL)isBlockLevel
{
  return self->mIsBlockLevel;
}

- (void)setIsBlockLevel:(BOOL)a3
{
  self->mIsBlockLevel = a3;
}

- (BOOL)ignoreContainedText
{
  return self->mIgnoreContainedText;
}

- (void)setIgnoreContainedText:(BOOL)a3
{
  self->mIgnoreContainedText = a3;
}

- (BOOL)denotesList
{
  return self->mDenotesList;
}

- (void)setDenotesList:(BOOL)a3
{
  self->mDenotesList = a3;
}

- (BOOL)denotesListItem
{
  return self->mDenotesListItem;
}

- (void)setDenotesListItem:(BOOL)a3
{
  self->mDenotesListItem = a3;
}

- (BOOL)isItsOwnParagraph
{
  return self->mIsItsOwnParagraph;
}

- (void)setIsItsOwnParagraph:(BOOL)a3
{
  self->mIsItsOwnParagraph = a3;
}

- (BOOL)isTableRelated
{
  return self->mIsTableRelated;
}

- (void)setIsTableRelated:(BOOL)a3
{
  self->mIsTableRelated = a3;
}

- (BOOL)hasTextAlign
{
  return self->mHasTextAlign;
}

- (void)setHasTextAlign:(BOOL)a3
{
  self->mHasTextAlign = a3;
}

@end
