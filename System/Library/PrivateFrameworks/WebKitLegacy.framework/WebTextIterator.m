@implementation WebTextIterator

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WebTextIterator;
  -[WebTextIterator dealloc](&v3, sel_dealloc);
}

- (WebTextIterator)initWithRange:(id)a3
{
  WebTextIterator *v4;
  uint64_t v5;
  WebTextIteratorPrivate *v6;
  TextIterator *value;
  WTF *v8;
  void *v9;
  WebCore::Node *v11;
  WebCore::Node *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)WebTextIterator;
  v4 = -[WebTextIterator init](&v13, sel_init);
  if (!v4)
    return v4;
  v4->_private = objc_alloc_init(WebTextIteratorPrivate);
  if (!a3)
    return v4;
  WebCore::makeSimpleRange();
  v5 = WTF::fastMalloc((WTF *)0x100);
  WebCore::TextIterator::TextIterator();
  v6 = v4->_private;
  value = v6->_textIterator.__ptr_.__value_;
  v6->_textIterator.__ptr_.__value_ = (TextIterator *)v5;
  if (value)
  {
    v8 = (WTF *)MEMORY[0x1D82A4310]();
    WTF::fastFree(v8, v9);
  }
  if (v12)
  {
    if (*((_DWORD *)v12 + 6) == 2)
    {
      if ((*((_WORD *)v12 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v12);
    }
    else
    {
      *((_DWORD *)v12 + 6) -= 2;
    }
  }
  if (!v11)
    return v4;
  if (*((_DWORD *)v11 + 6) != 2)
  {
    *((_DWORD *)v11 + 6) -= 2;
    return v4;
  }
  if ((*((_WORD *)v11 + 15) & 0x400) != 0)
    return v4;
  WebCore::Node::removedLastRef(v11);
  return v4;
}

- (void)advance
{
  WebTextIteratorPrivate *v3;
  WebCore::TextIterator *value;

  v3 = self->_private;
  value = (WebCore::TextIterator *)v3->_textIterator.__ptr_.__value_;
  if (value)
  {
    WebCore::TextIterator::advance(value);
    v3 = self->_private;
  }
  v3->_upconvertedText.m_size = 0;
}

- (BOOL)atEnd
{
  TextIterator *value;

  value = self->_private->_textIterator.__ptr_.__value_;
  return value && *((_QWORD *)value + 12) == 0;
}

- (id)currentRange
{
  TextIterator *value;
  DOMObjectInternal *v3;
  WebCore::Node *v5;
  WebCore::Node *v6;
  DOMObjectInternal *v7;

  value = self->_private->_textIterator.__ptr_.__value_;
  if (!value || !*((_QWORD *)value + 12))
    return 0;
  WebCore::TextIterator::range((WebCore::TextIterator *)value);
  WebCore::createLiveRange();
  v3 = kit(v7);
  if (v7)
  {
    if (*((_DWORD *)v7 + 2) == 1)
      (*(void (**)())(*(_QWORD *)v7 + 8))();
    else
      --*((_DWORD *)v7 + 2);
  }
  if (v6)
  {
    if (*((_DWORD *)v6 + 6) == 2)
    {
      if ((*((_WORD *)v6 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v6);
    }
    else
    {
      *((_DWORD *)v6 + 6) -= 2;
    }
  }
  if (v5)
  {
    if (*((_DWORD *)v5 + 6) == 2)
    {
      if ((*((_WORD *)v5 + 15) & 0x400) == 0)
        WebCore::Node::removedLastRef(v5);
    }
    else
    {
      *((_DWORD *)v5 + 6) -= 2;
    }
  }
  return v3;
}

- (const)currentTextPointer
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const unsigned __int16 *v5;
  unsigned __int8 *v6;
  const unsigned __int16 *v7;
  WTF *v8;
  uint64_t v9;
  void *v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned int v13;
  const unsigned __int16 *v14;
  __int16 v15;
  unint64_t v16;
  char *v17;
  char *v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  BOOL v22;
  BOOL v23;
  unint64_t v24;
  int v25;
  uint8x8_t *v26;
  unsigned int v27;
  unint64_t v28;
  uint16x8_t *v29;
  uint8x16_t v30;
  uint16x8_t v31;
  uint16x8_t v32;
  unint64_t v33;
  uint8x8_t *v34;
  uint64_t v35;
  unsigned int v36;
  uint8x8_t v37;

  v2 = *((_QWORD *)self + 1);
  v3 = *(_QWORD *)(v2 + 8);
  if (!v3)
    return 0;
  v4 = *(_QWORD *)(v3 + 152);
  if (!(_DWORD)v4)
    return 0;
  v5 = *(const unsigned __int16 **)(v3 + 144);
  if ((v4 & 0xFF00000000) == 0)
    return v5;
  v6 = (unsigned __int8 *)(v2 + 28);
  if (*(_DWORD *)(v2 + 28))
    return *(const unsigned __int16 **)(v2 + 16);
  v7 = self;
  v8 = *(WTF **)(v2 + 16);
  if (v4 <= (unint64_t)*(unsigned int *)(v2 + 24))
    goto LABEL_11;
  if (!((unint64_t)v4 >> 31))
  {
    v9 = WTF::fastMalloc((WTF *)(2 * v4));
    *(_DWORD *)(v2 + 24) = v4;
    *(_QWORD *)(v2 + 16) = v9;
    if (!v8)
    {
      v8 = (WTF *)v9;
      v11 = (unsigned __int8 *)v5 + v4;
      v12 = *(unsigned int *)v6;
      if (v4 < 8uLL)
        goto LABEL_12;
LABEL_19:
      if (!__CFADD__((_DWORD)v12, v4 - 1) && !(((unint64_t)v4 - 1) >> 32))
      {
        v16 = v2 + 32;
        v17 = (char *)v8 + 2 * v12;
        v18 = (char *)v8 + 2 * v4 + 2 * v12;
        v19 = v6 >= (unsigned __int8 *)v18 || (unint64_t)v17 >= v16;
        v20 = !v19;
        v21 = v18 <= (char *)v5 || v17 >= (char *)v11;
        v22 = !v21;
        v23 = v16 <= (unint64_t)v5 || v6 >= v11;
        if (v23 && !v20 && !v22)
        {
          if (v4 >= 0x20uLL)
          {
            v24 = v4 - (unint64_t)(v4 & 0x1F);
            v25 = v12 + v24;
            v26 = (uint8x8_t *)(v5 + 8);
            v27 = v12;
            v28 = v24;
            do
            {
              v29 = (uint16x8_t *)((char *)v8 + 2 * v27);
              v30 = *(uint8x16_t *)v26[-2].i8;
              v31 = vmovl_u8(*v26);
              v32 = vmovl_high_u8(*(uint8x16_t *)v26->i8);
              *v29 = vmovl_u8(*(uint8x8_t *)v30.i8);
              v29[1] = vmovl_high_u8(v30);
              v29[2] = v31;
              v29[3] = v32;
              v26 += 4;
              v27 += 32;
              v28 -= 32;
            }
            while (v28);
            *(_DWORD *)v6 = v27;
            if ((v4 & 0x1F) == 0)
              goto LABEL_14;
            if ((v4 & 0x1Fu) < 8uLL)
            {
              v14 = (const unsigned __int16 *)((char *)v5 + v24);
              v13 = v12 + v24;
              do
              {
LABEL_13:
                v15 = *(unsigned __int8 *)v14;
                v14 = (const unsigned __int16 *)((char *)v14 + 1);
                *((_WORD *)v8 + v13++) = v15;
                *(_DWORD *)v6 = v13;
              }
              while (v14 != (const unsigned __int16 *)v11);
LABEL_14:
              v2 = *((_QWORD *)v7 + 1);
              return *(const unsigned __int16 **)(v2 + 16);
            }
          }
          else
          {
            v24 = 0;
            v25 = v12;
          }
          v33 = v4 - (unint64_t)(v4 & 7);
          v13 = v12 + v33;
          v14 = (const unsigned __int16 *)((char *)v5 + v33);
          v34 = (uint8x8_t *)((char *)v5 + v24);
          v35 = v24 + (v4 & 7) - v4;
          v36 = v12 + v24;
          do
          {
            v37 = *v34++;
            *(uint16x8_t *)((char *)v8 + 2 * v36) = vmovl_u8(v37);
            v36 += 8;
            v25 += 8;
            v35 += 8;
          }
          while (v35);
          *(_DWORD *)v6 = v25;
          if ((v4 & 7) == 0)
            goto LABEL_14;
          goto LABEL_13;
        }
      }
LABEL_12:
      v13 = v12;
      v14 = v5;
      goto LABEL_13;
    }
    if ((WTF *)v9 == v8)
    {
      *(_QWORD *)(v2 + 16) = 0;
      *(_DWORD *)(v2 + 24) = 0;
    }
    WTF::fastFree(v8, v10);
    v8 = *(WTF **)(v2 + 16);
LABEL_11:
    v11 = (unsigned __int8 *)v5 + v4;
    v12 = *(unsigned int *)v6;
    if (v4 < 8uLL)
      goto LABEL_12;
    goto LABEL_19;
  }
  __break(0xC471u);
  return self;
}

- (unint64_t)currentTextLength
{
  TextIterator *value;

  value = self->_private->_textIterator.__ptr_.__value_;
  if (value)
    return *((unsigned int *)value + 38);
  else
    return 0;
}

- (id)currentNode
{
  id result;
  WebCore::Node *v3;

  result = self->_private->_textIterator.__ptr_.__value_;
  if (result)
  {
    v3 = (WebCore::Node *)WebCore::TextIterator::node((WebCore::TextIterator *)result);
    return kit(v3);
  }
  return result;
}

- (id)currentText
{
  TextIterator *value;
  CFTypeRef v3;
  CFTypeRef v4;
  CFTypeRef v5;
  __int128 v7;
  CFTypeRef cf;

  value = self->_private->_textIterator.__ptr_.__value_;
  if (!value)
    return &stru_1E9D6EC48;
  v7 = *((_OWORD *)value + 9);
  WTF::StringView::createNSString((WTF::StringView *)&v7);
  v3 = cf;
  cf = 0;
  v4 = (id)CFMakeCollectable(v3);
  v5 = cf;
  cf = 0;
  if (v5)
    CFRelease(v5);
  return (id)v4;
}

@end
