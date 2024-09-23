@implementation SBTemplateAndMorph

- (SBTemplateAndMorph)initWithTemplate:(id)a3 morph:(id)a4
{
  id v7;
  id v8;
  SBTemplateAndMorph *v9;
  SBTemplateAndMorph *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBTemplateAndMorph;
  v9 = -[SBTemplateAndMorph init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_morphedCandidate, a4);
    objc_storeStrong((id *)&v10->_touchTemplate, a3);
  }

  return v10;
}

- (SBPolygon)morphedCandidate
{
  return self->_morphedCandidate;
}

- (SBTouchTemplate)touchTemplate
{
  return self->_touchTemplate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchTemplate, 0);
  objc_storeStrong((id *)&self->_morphedCandidate, 0);
}

@end
