@implementation VITextBlockAnnotation

- (VITextBlockAnnotation)initWithTextAnnotations:(id)a3
{
  id v4;
  VITextBlockAnnotation *v5;
  uint64_t v6;
  NSArray *textAnnotations;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VITextBlockAnnotation;
  v5 = -[VITextBlockAnnotation init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    textAnnotations = v5->_textAnnotations;
    v5->_textAnnotations = (NSArray *)v6;

  }
  return v5;
}

+ (id)empty
{
  VITextBlockAnnotation *v2;

  v2 = [VITextBlockAnnotation alloc];
  return -[VITextBlockAnnotation initWithTextAnnotations:](v2, "initWithTextAnnotations:", MEMORY[0x1E0C9AA60]);
}

+ (id)textBlockWithAnnotations:(id)a3
{
  id v3;
  VITextBlockAnnotation *v4;

  v3 = a3;
  v4 = -[VITextBlockAnnotation initWithTextAnnotations:]([VITextBlockAnnotation alloc], "initWithTextAnnotations:", v3);

  return v4;
}

+ (id)textBlockWithDocumentObservations:(id)a3
{
  void *v3;
  VITextBlockAnnotation *v4;

  v3 = (void *)VIFlatMapArray(a3, &__block_literal_global_4);
  v4 = -[VITextBlockAnnotation initWithTextAnnotations:]([VITextBlockAnnotation alloc], "initWithTextAnnotations:", v3);

  return v4;
}

id __59__VITextBlockAnnotation_textBlockWithDocumentObservations___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "blocksWithTypes:inRegion:", 8, *MEMORY[0x1E0CEE388], *(double *)(MEMORY[0x1E0CEE388] + 8), *(double *)(MEMORY[0x1E0CEE388] + 16), *(double *)(MEMORY[0x1E0CEE388] + 24));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)VICompactMapArray(v2, &__block_literal_global_44);

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  NSArray *textAnnotations;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  if (a3 == self)
    return 1;
  v15 = v5;
  v16 = v3;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  textAnnotations = self->_textAnnotations;
  objc_msgSend(v11, "textAnnotations", v6, v15, v4, v16, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(textAnnotations) = VIObjectIsEqual((unint64_t)textAnnotations, (uint64_t)v13);

  return (char)textAnnotations;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_textAnnotations, "hash");
}

- (NSArray)textAnnotations
{
  return self->_textAnnotations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textAnnotations, 0);
}

- (NSString)description
{
  return (NSString *)sub_1D481EFD4(self, (uint64_t)a2, (void (*)(void))VITextBlockAnnotation.description.getter);
}

@end
