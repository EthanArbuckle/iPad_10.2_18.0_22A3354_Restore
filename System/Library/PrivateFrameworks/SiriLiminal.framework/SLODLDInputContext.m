@implementation SLODLDInputContext

- (SLODLDInputContext)initWithInputOrigin:(id)a3 inputAnchor:(id)a4 prevTokens:(id)a5 prevEmb:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SLODLDInputContext *v15;
  SLODLDInputContext *v16;
  uint64_t v17;
  NSArray *prevTokens;
  uint64_t v19;
  NSData *prevEmb;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)SLODLDInputContext;
  v15 = -[SLODLDInputContext init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_inputOrigin, a3);
    objc_storeStrong((id *)&v16->_inputAnchor, a4);
    v17 = objc_msgSend(v13, "copy");
    prevTokens = v16->_prevTokens;
    v16->_prevTokens = (NSArray *)v17;

    v19 = objc_msgSend(v14, "copy");
    prevEmb = v16->_prevEmb;
    v16->_prevEmb = (NSData *)v19;

  }
  return v16;
}

- (void)updateWithInputUtt:(id)a3
{
  objc_storeStrong((id *)&self->_inputUtt, a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Utterance: %@ Input Origin: %@, Input Anchor %@, Prev tokens %@"), self->_inputUtt, self->_inputOrigin, self->_inputAnchor, self->_prevTokens);
}

- (NSString)inputUtt
{
  return self->_inputUtt;
}

- (NSNumber)inputOrigin
{
  return self->_inputOrigin;
}

- (NSNumber)inputAnchor
{
  return self->_inputAnchor;
}

- (NSData)prevEmb
{
  return self->_prevEmb;
}

- (NSArray)prevTokens
{
  return self->_prevTokens;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevTokens, 0);
  objc_storeStrong((id *)&self->_prevEmb, 0);
  objc_storeStrong((id *)&self->_inputAnchor, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_inputUtt, 0);
}

@end
