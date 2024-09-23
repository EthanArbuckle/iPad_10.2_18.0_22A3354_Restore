@implementation VIAnnotation

- (VIAnnotation)initWithFaceAnnotations:(id)a3 humanAnnotations:(id)a4 nsfwAnnotations:(id)a5 textBlockAnnotation:(id)a6 scenenetAnnotation:(id)a7 barcodeAnnotation:(id)a8
{
  return -[VIAnnotation initWithReducePersonOverTriggerAnnotation:faceAnnotations:humanAnnotations:nsfwAnnotations:textBlockAnnotation:scenenetAnnotation:barcodeAnnotation:](self, "initWithReducePersonOverTriggerAnnotation:faceAnnotations:humanAnnotations:nsfwAnnotations:textBlockAnnotation:scenenetAnnotation:barcodeAnnotation:", 0, a3, a4, a5, a6, a7, a8);
}

- (VIAnnotation)initWithReducePersonOverTriggerAnnotation:(id)a3 faceAnnotations:(id)a4 humanAnnotations:(id)a5 nsfwAnnotations:(id)a6 textBlockAnnotation:(id)a7 scenenetAnnotation:(id)a8 barcodeAnnotation:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  VIAnnotation *v22;
  uint64_t v23;
  VIReducePersonOverTriggerAnnotation *reducePersonOverTriggerAnnotation;
  uint64_t v25;
  NSArray *faceAnnotations;
  uint64_t v27;
  NSArray *humanAnnotations;
  uint64_t v29;
  NSArray *nsfwAnnotations;
  uint64_t v31;
  VITextBlockAnnotation *textBlockAnnotation;
  uint64_t v33;
  VIScenenetAnnotation *scenenetAnnotation;
  uint64_t v35;
  VIBarcodeAnnotation *barcodeAnnotation;
  objc_super v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v38.receiver = self;
  v38.super_class = (Class)VIAnnotation;
  v22 = -[VIAnnotation init](&v38, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    reducePersonOverTriggerAnnotation = v22->_reducePersonOverTriggerAnnotation;
    v22->_reducePersonOverTriggerAnnotation = (VIReducePersonOverTriggerAnnotation *)v23;

    v25 = objc_msgSend(v16, "copy");
    faceAnnotations = v22->_faceAnnotations;
    v22->_faceAnnotations = (NSArray *)v25;

    v27 = objc_msgSend(v17, "copy");
    humanAnnotations = v22->_humanAnnotations;
    v22->_humanAnnotations = (NSArray *)v27;

    v29 = objc_msgSend(v18, "copy");
    nsfwAnnotations = v22->_nsfwAnnotations;
    v22->_nsfwAnnotations = (NSArray *)v29;

    v31 = objc_msgSend(v19, "copy");
    textBlockAnnotation = v22->_textBlockAnnotation;
    v22->_textBlockAnnotation = (VITextBlockAnnotation *)v31;

    v33 = objc_msgSend(v20, "copy");
    scenenetAnnotation = v22->_scenenetAnnotation;
    v22->_scenenetAnnotation = (VIScenenetAnnotation *)v33;

    v35 = objc_msgSend(v21, "copy");
    barcodeAnnotation = v22->_barcodeAnnotation;
    v22->_barcodeAnnotation = (VIBarcodeAnnotation *)v35;

  }
  return v22;
}

- (VIAnnotation)initWithTextAnnotations:(id)a3
{
  return -[VIAnnotation initWithReducePersonOverTriggerAnnotation:faceAnnotations:humanAnnotations:nsfwAnnotations:textBlockAnnotation:scenenetAnnotation:barcodeAnnotation:](self, "initWithReducePersonOverTriggerAnnotation:faceAnnotations:humanAnnotations:nsfwAnnotations:textBlockAnnotation:scenenetAnnotation:barcodeAnnotation:", 0, 0, 0, 0, a3, 0, 0);
}

- (VIAnnotation)initWithAnnotations:(id)a3 humanAnnotations:(id)a4 nsfwAnnotations:(id)a5 textBlockAnnotation:(id)a6
{
  return -[VIAnnotation initWithReducePersonOverTriggerAnnotation:faceAnnotations:humanAnnotations:nsfwAnnotations:textBlockAnnotation:scenenetAnnotation:barcodeAnnotation:](self, "initWithReducePersonOverTriggerAnnotation:faceAnnotations:humanAnnotations:nsfwAnnotations:textBlockAnnotation:scenenetAnnotation:barcodeAnnotation:", 0, a3, a4, a5, a6, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  VIAnnotation *v4;
  VIAnnotation *v5;
  VIAnnotation *v6;
  NSArray *faceAnnotations;
  void *v8;
  NSArray *humanAnnotations;
  void *v10;
  NSArray *nsfwAnnotations;
  void *v12;
  VITextBlockAnnotation *textBlockAnnotation;
  void *v14;
  VIScenenetAnnotation *scenenetAnnotation;
  void *v16;
  VIBarcodeAnnotation *barcodeAnnotation;
  void *v18;
  VIReducePersonOverTriggerAnnotation *reducePersonOverTriggerAnnotation;
  void *v20;
  char IsEqual;

  v4 = (VIAnnotation *)a3;
  if (v4 == self)
  {
    IsEqual = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    faceAnnotations = self->_faceAnnotations;
    -[VIAnnotation faceAnnotations](v6, "faceAnnotations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)faceAnnotations, (uint64_t)v8))
    {
      humanAnnotations = self->_humanAnnotations;
      -[VIAnnotation humanAnnotations](v6, "humanAnnotations");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (VIObjectIsEqual((unint64_t)humanAnnotations, (uint64_t)v10))
      {
        nsfwAnnotations = self->_nsfwAnnotations;
        -[VIAnnotation nsfwAnnotations](v6, "nsfwAnnotations");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (VIObjectIsEqual((unint64_t)nsfwAnnotations, (uint64_t)v12))
        {
          textBlockAnnotation = self->_textBlockAnnotation;
          -[VIAnnotation textBlockAnnotation](v6, "textBlockAnnotation");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (VIObjectIsEqual((unint64_t)textBlockAnnotation, (uint64_t)v14))
          {
            scenenetAnnotation = self->_scenenetAnnotation;
            -[VIAnnotation scenenetAnnotation](v6, "scenenetAnnotation");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (VIObjectIsEqual((unint64_t)scenenetAnnotation, (uint64_t)v16))
            {
              barcodeAnnotation = self->_barcodeAnnotation;
              -[VIAnnotation barcodeAnnotation](v6, "barcodeAnnotation");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (VIObjectIsEqual((unint64_t)barcodeAnnotation, (uint64_t)v18))
              {
                reducePersonOverTriggerAnnotation = self->_reducePersonOverTriggerAnnotation;
                -[VIAnnotation reducePersonOverTriggerAnnotation](v6, "reducePersonOverTriggerAnnotation");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                IsEqual = VIObjectIsEqual((unint64_t)reducePersonOverTriggerAnnotation, (uint64_t)v20);

              }
              else
              {
                IsEqual = 0;
              }

            }
            else
            {
              IsEqual = 0;
            }

          }
          else
          {
            IsEqual = 0;
          }

        }
        else
        {
          IsEqual = 0;
        }

      }
      else
      {
        IsEqual = 0;
      }

    }
    else
    {
      IsEqual = 0;
    }

  }
  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[NSArray hash](self->_faceAnnotations, "hash");
  v4 = -[NSArray hash](self->_humanAnnotations, "hash") ^ v3;
  v5 = -[NSArray hash](self->_nsfwAnnotations, "hash");
  v6 = v4 ^ v5 ^ -[VITextBlockAnnotation hash](self->_textBlockAnnotation, "hash");
  v7 = -[VIScenenetAnnotation hash](self->_scenenetAnnotation, "hash");
  return v6 ^ v7 ^ -[VIBarcodeAnnotation hash](self->_barcodeAnnotation, "hash");
}

- (NSArray)nsfwAnnotations
{
  return self->_nsfwAnnotations;
}

- (NSArray)faceAnnotations
{
  return self->_faceAnnotations;
}

- (NSArray)humanAnnotations
{
  return self->_humanAnnotations;
}

- (VITextBlockAnnotation)textBlockAnnotation
{
  return self->_textBlockAnnotation;
}

- (VIScenenetAnnotation)scenenetAnnotation
{
  return self->_scenenetAnnotation;
}

- (VIBarcodeAnnotation)barcodeAnnotation
{
  return self->_barcodeAnnotation;
}

- (VIReducePersonOverTriggerAnnotation)reducePersonOverTriggerAnnotation
{
  return self->_reducePersonOverTriggerAnnotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reducePersonOverTriggerAnnotation, 0);
  objc_storeStrong((id *)&self->_barcodeAnnotation, 0);
  objc_storeStrong((id *)&self->_scenenetAnnotation, 0);
  objc_storeStrong((id *)&self->_textBlockAnnotation, 0);
  objc_storeStrong((id *)&self->_humanAnnotations, 0);
  objc_storeStrong((id *)&self->_faceAnnotations, 0);
  objc_storeStrong((id *)&self->_nsfwAnnotations, 0);
}

@end
