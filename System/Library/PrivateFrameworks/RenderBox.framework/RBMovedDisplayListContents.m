@implementation RBMovedDisplayListContents

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)renderInContext:(CGContext *)a3 options:(id)a4
{
  Contents *p;

  p = self->_contents._p;
  if (p)
  {
    render_contents(a3, (NSDictionary *)a4, (const RB::DisplayList::Contents *)p, (_RBDrawingState *)self->_xml_document.__ptr_.__value_);
    RBXMLRecorderMarkCGFrame(self, a3);
  }
}

- (void).cxx_destruct
{
  unique_ptr<RB::XML::Document, std::default_delete<RB::XML::Document>> *p_xml_document;
  uint64_t v4;
  Document *value;
  Contents *p;
  unsigned int *v7;
  unsigned int v8;
  unsigned int v9;

  value = self->_xml_document.__ptr_.__value_;
  p_xml_document = &self->_xml_document;
  v4 = (uint64_t)value;
  p_xml_document->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)p_xml_document, v4);
  p = self->_contents._p;
  if (p)
  {
    v7 = (unsigned int *)((char *)p + 8);
    do
    {
      v8 = __ldxr(v7);
      v9 = v8 - 1;
    }
    while (__stlxr(v9, v7));
    if (!v9)
    {
      __dmb(9u);
      (*(void (**)(Contents *))(*(_QWORD *)p + 8))(p);
    }
  }
}

- (CGRect)boundingRect
{
  Contents *p;
  float32x2_t v3;
  float32x2_t v4;
  float64x2_t v5;
  float64x2_t v6;
  double v7;
  double v8;
  CGRect result;

  p = self->_contents._p;
  if (p)
  {
    v3 = RB::DisplayList::Layer::bounds((RB::DisplayList::Layer *)((char *)p + 320));
    v5 = vcvtq_f64_f32(v4);
    v6 = vcvtq_f64_f32(v3);
  }
  else
  {
    v6 = *(float64x2_t *)MEMORY[0x24BDBF070];
    v5 = *(float64x2_t *)(MEMORY[0x24BDBF070] + 16);
  }
  v7 = v6.f64[1];
  v8 = v5.f64[1];
  result.size.width = v5.f64[0];
  result.origin.x = v6.f64[0];
  result.size.height = v8;
  result.origin.y = v7;
  return result;
}

- (BOOL)isEmpty
{
  Contents *p;

  p = self->_contents._p;
  return !p || *((_QWORD *)p + 40) == 0;
}

- (_QWORD)initWithContents:(uint64_t *)a3 xmlDocument:
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  if (!a1)
    return 0;
  v12.receiver = a1;
  v12.super_class = (Class)RBMovedDisplayListContents;
  v5 = objc_msgSendSuper2(&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = v5[1];
    v5[1] = *a2;
    *a2 = v7;
    v8 = *a3;
    *a3 = 0;
    v9 = (uint64_t)(v5 + 2);
    v10 = v6[2];
    v6[2] = v8;
    if (v10)
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100](v9, v10);
  }
  return v6;
}

- (const)_rb_contents
{
  return self->_contents._p;
}

- (const)_rb_xml_document
{
  return self->_xml_document.__ptr_.__value_;
}

- (void)_drawInState:(_RBDrawingState *)a3 alpha:(float)a4
{
  const RB::XML::Document *v4;
  _QWORD *v8;
  Contents *p;
  RB::XML::DisplayList *v10;
  Document *value;

  v8 = (_QWORD *)*((_QWORD *)a3 + 1);
  if (!v8[3])
    make_contents(*((unsigned int **)a3 + 1));
  p = self->_contents._p;
  if (p)
    RB::DisplayList::Builder::draw((RB::DisplayList::Builder *)(v8 + 2), (const RB::DisplayList::Contents *)p, (RB::DisplayList::State *)a3, a4, 0, 0);
  v10 = (RB::XML::DisplayList *)v8[38];
  if (v10)
  {
    value = self->_xml_document.__ptr_.__value_;
    if (value)
      RB::XML::DisplayList::draw_list(v10, (RB::XML::Document *)a3, (_RBDrawingState *)value, v4, a4);
  }
}

- (void)drawInState:(_RBDrawingState *)a3
{
  double v3;

  LODWORD(v3) = 1.0;
  -[RBMovedDisplayListContents _drawInState:alpha:](self, "_drawInState:alpha:", a3, v3);
}

+ (id)decodedObjectWithData:(id)a3 delegate:(id)a4 error:(id *)a5
{
  RB::DisplayList::Contents *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  RB::DisplayList::Contents *v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  RB::DisplayList::Contents *v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char *v28;
  _QWORD *v29;
  _BYTE v30[80];
  void *v31[2];
  _OWORD v32[2];
  unsigned __int8 v33[16];
  int v34;
  char v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = (RB::DisplayList::Contents *)operator new();
  RB::DisplayList::Contents::Contents(v8, 0);
  v20 = v8;
  v19[0] = &unk_24C228D90;
  v19[1] = a4;
  v19[2] = v8;
  v21 = objc_msgSend(a3, "bytes");
  v22 = v21 + objc_msgSend(a3, "length");
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  v28 = (char *)v8 + 16;
  v29 = v19;
  RB::UntypedTable::UntypedTable((RB::UntypedTable *)v30, 0, 0, 0, 0, 0);
  memset(v32, 0, sizeof(v32));
  *(_OWORD *)v31 = 0u;
  uuid_clear(v33);
  v34 = 0;
  v35 = 1;
  RB::DisplayList::Contents::decode(v8, (RB::Decoder *)&v21);
  if (v27 || v21 > v22)
  {
    if (a5 && !*a5)
    {
      v9 = 0;
      *a5 = (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("RBCodableError"), -1, 0);
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v17 = 0;
    v18 = 0;
    v9 = -[RBMovedDisplayListContents initWithContents:xmlDocument:]([RBMovedDisplayListContents alloc], &v20, &v17);
    v10 = v17;
    v17 = 0;
    if (v10)
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v17, v10);
    v11 = v18;
    v18 = 0;
    if (v11)
      std::default_delete<RB::XML::Document>::operator()[abi:nn180100]((uint64_t)&v18, v11);
  }
  RB::ObjectTable::~ObjectTable((RB::ObjectTable *)((char *)v32 + 8));
  if (v31[0])
    free(v31[0]);
  RB::UntypedTable::~UntypedTable((RB::UntypedTable *)v30);
  if (v24)
    free(v24);
  v12 = v20;
  if (v20)
  {
    v13 = (unsigned int *)((char *)v20 + 8);
    do
    {
      v14 = __ldxr(v13);
      v15 = v14 - 1;
    }
    while (__stlxr(v15, v13));
    if (!v15)
    {
      __dmb(9u);
      (*(void (**)(RB::DisplayList::Contents *))(*(_QWORD *)v12 + 8))(v12);
    }
  }
  return v9;
}

- (id)encodedDataForDelegate:(id)a3 error:(id *)a4
{
  return encode_contents((RB::DisplayList::Contents *)self->_contents._p, a3, a4);
}

@end
