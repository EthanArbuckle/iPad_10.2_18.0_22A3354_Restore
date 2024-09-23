@implementation CRLPdfTaggerTextColumnContext

- (CRLPdfTaggerTextColumnContext)initWithStateOfTagger:(id)a3 column:(id)a4 limitSelection:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRLPdfTaggerTextColumnContext *v11;
  void *v12;
  id WeakRetained;
  uint64_t v14;
  uint64_t v15;
  char isKindOfClass;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t *p_location;
  NSUInteger v25;
  id v26;
  NSUInteger v27;
  NSUInteger v28;
  NSUInteger location;
  NSUInteger length;
  NSRange v31;
  NSUInteger v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  NSUInteger v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSUInteger v50;
  id v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  void *v58;
  uint64_t v59;
  id obj[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  NSUInteger v64;
  objc_super v65;
  NSRange v66;
  NSRange v67;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v65.receiver = self;
  v65.super_class = (Class)CRLPdfTaggerTextColumnContext;
  v58 = v8;
  v11 = -[CRLPdfTaggerContext initWithStateOfTagger:](&v65, "initWithStateOfTagger:", v8);
  if (!v11)
    goto LABEL_28;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topOfContextStack"));
  objc_storeWeak((id *)&v11->_textColumnOwner, v12);

  WeakRetained = objc_loadWeakRetained((id *)&v11->_textColumnOwner);
  objc_opt_class(CRLPdfTaggerTextColumnOwnerContext, v14);
  isKindOfClass = objc_opt_isKindOfClass(WeakRetained, v15);

  if ((isKindOfClass & 1) == 0)
    sub_10042E790(0, (uint64_t)"The parent of a column must be a column owner", v17, v18, v19, v20, v21, v22, (uint64_t)v58);
  objc_storeWeak((id *)&v11->_column, v9);
  objc_storeWeak((id *)&v11->_limitSelection, v10);
  v23 = (unint64_t)objc_msgSend(v9, "range");
  p_location = &v11->_range.location;
  v11->_range.location = v23;
  v11->_range.length = v25;
  if (v10)
  {
    v26 = objc_msgSend(v9, "range");
    v28 = v27;
    v66.location = (NSUInteger)objc_msgSend(v10, "superRange");
    location = v66.location;
    length = v66.length;
    v67.location = (NSUInteger)v26;
    v67.length = v28;
    v31 = NSIntersectionRange(v66, v67);
    if (length)
    {
      v32 = v31.length;
      if (!v31.length)
      {
        v33 = 0;
        v23 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_25;
      }
      location = v31.location;
    }
    else
    {
      v23 = 0x7FFFFFFFFFFFFFFFLL;
      if (location < (unint64_t)v26)
      {
LABEL_12:
        v33 = 0;
        goto LABEL_25;
      }
      v33 = 0;
      if (location - (unint64_t)v26 >= v28)
      {
LABEL_25:
        *p_location = v23;
        v11->_range.length = v33;
        goto LABEL_26;
      }
      v32 = 0;
    }
    v23 = 0x7FFFFFFFFFFFFFFFLL;
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      v40 = (char *)objc_msgSend(v9, "lineCount");
      v41 = 0;
      if (v40)
      {
        while (1)
        {
          v23 = (unint64_t)objc_msgSend(v9, "rangeOfLineFragmentAtIndex:", v41);
          if (location >= v23 && location - v23 < v42)
            break;
          if (v40 == ++v41)
          {
            v23 = 0x7FFFFFFFFFFFFFFFLL;
            v41 = v40;
            break;
          }
        }
      }
      sub_10042E790(v23 != 0x7FFFFFFFFFFFFFFFLL, (uint64_t)"Range start couldn't be found", v34, v35, v36, v37, v38, v39, (uint64_t)v58);
      v49 = 0x7FFFFFFFFFFFFFFFLL;
      if (v41 < v40)
      {
        v50 = location + v32;
        while (1)
        {
          v51 = objc_msgSend(v9, "rangeOfLineFragmentAtIndex:", v41);
          v49 = (uint64_t)v51 + v52;
          if (v50 <= (unint64_t)v51 + v52)
            break;
          if (v40 == ++v41)
          {
            v49 = 0x7FFFFFFFFFFFFFFFLL;
            break;
          }
        }
      }
      sub_10042E790(v49 != 0x7FFFFFFFFFFFFFFFLL, (uint64_t)"Range end couldn't be found", v43, v44, v45, v46, v47, v48, v59);
      v33 = v49 - v23;
      goto LABEL_25;
    }
    goto LABEL_12;
  }
LABEL_26:
  if (v23 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "storage"));
    sub_1001720FC((uint64_t)obj, v53, 0, (uint64_t)objc_msgSend(v53, "paragraphIndexAtCharIndex:", *p_location), (uint64_t)objc_msgSend(v53, "paragraphIndexAtCharIndex:", v11->_range.length + *p_location), 1);
    objc_storeStrong((id *)&v11->_paragraphEnumerator._storage, obj[0]);
    objc_storeStrong((id *)&v11->_paragraphEnumerator._styleProvider, obj[1]);
    v54 = v61;
    v55 = v62;
    v56 = v63;
    v11->_paragraphEnumerator._currentTextRange.length = v64;
    *(_OWORD *)&v11->_paragraphEnumerator._firstParIndex = v55;
    *(_OWORD *)&v11->_paragraphEnumerator._requireHidden = v56;
    *(_OWORD *)&v11->_paragraphEnumerator._parIndex = v54;
    sub_100171FA4(obj);

  }
LABEL_28:

  return v11;
}

- (CRLWPParagraphEnumerator)paragraphEnumerator
{
  return &self->_paragraphEnumerator;
}

- (CRLPdfTaggerTextColumnOwnerContext)textColumnOwner
{
  return (CRLPdfTaggerTextColumnOwnerContext *)objc_loadWeakRetained((id *)&self->_textColumnOwner);
}

- (CRLWPColumn)column
{
  return (CRLWPColumn *)objc_loadWeakRetained((id *)&self->_column);
}

- (CRLWPSelection)limitSelection
{
  return (CRLWPSelection *)objc_loadWeakRetained((id *)&self->_limitSelection);
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_limitSelection);
  objc_destroyWeak((id *)&self->_column);
  objc_destroyWeak((id *)&self->_textColumnOwner);
  sub_100171FA4((id *)&self->_paragraphEnumerator._storage);
}

- (id).cxx_construct
{
  sub_100171FD4((uint64_t)&self->_paragraphEnumerator);
  return self;
}

@end
