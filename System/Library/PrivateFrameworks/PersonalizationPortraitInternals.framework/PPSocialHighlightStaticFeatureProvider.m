@implementation PPSocialHighlightStaticFeatureProvider

- (_QWORD)initWithComputedFeatures:(void *)a3 highlightKeyBlock:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PPSocialHighlightStaticFeatureProvider;
    v8 = objc_msgSendSuper2(&v12, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong((id *)v8 + 1, a2);
      v9 = objc_msgSend(v7, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyBlock, 0);
  objc_storeStrong((id *)&self->_computedFeatures, 0);
}

- (id)valueForHighlight:(id)a3
{
  void *v4;
  void *v5;

  (*((void (**)(void))self->_keyBlock + 2))();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_computedFeatures, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &unk_1E7E5C0C8;
  }

  return v5;
}

@end
