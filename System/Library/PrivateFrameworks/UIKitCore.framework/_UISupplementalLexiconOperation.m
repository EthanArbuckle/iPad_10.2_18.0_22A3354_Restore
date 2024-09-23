@implementation _UISupplementalLexiconOperation

- (id)initAddOperationWithLexicon:(id)a3
{
  id *v4;
  _UISupplementalLexiconOperation *v5;
  _UISupplementalLexiconOperation *v6;
  objc_super v8;

  v4 = (id *)a3;
  v8.receiver = self;
  v8.super_class = (Class)_UISupplementalLexiconOperation;
  v5 = -[_UISupplementalLexiconOperation init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_type = 0;
    objc_storeWeak((id *)&v5->_lexicon, v4);
    v6->_lexiconIdentifier = objc_msgSend(v4[1], "identifier");
  }

  return v6;
}

- (id)initRemoveOperationWithLexiconIdentifier:(unint64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISupplementalLexiconOperation;
  result = -[_UISupplementalLexiconOperation init](&v5, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = 1;
    *((_QWORD *)result + 3) = a3;
  }
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (_UISupplementalLexicon)lexicon
{
  return (_UISupplementalLexicon *)objc_loadWeakRetained((id *)&self->_lexicon);
}

- (unint64_t)lexiconIdentifier
{
  return self->_lexiconIdentifier;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lexicon);
}

@end
