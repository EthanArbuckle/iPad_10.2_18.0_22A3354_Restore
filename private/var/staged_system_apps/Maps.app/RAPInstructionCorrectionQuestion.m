@implementation RAPInstructionCorrectionQuestion

- (unint64_t)maximumNumberOfPhotos
{
  return 1;
}

- (void)_fillSubmissionParameters:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  RAPPhoto *v27;
  void *v28;
  RAPPhoto *v29;
  RAPPhotoWithMetadata *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  RAPPhotoWithMetadata *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;

  v42 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "details"));
  if (!v4)
  {
    v4 = objc_alloc_init((Class)GEORPFeedbackDetails);
    objc_msgSend(v42, "setDetails:", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directionsFeedback"));

  if (!v5)
  {
    v6 = objc_alloc_init((Class)GEORPDirectionsFeedback);
    objc_msgSend(v4, "setDirectionsFeedback:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directionsFeedback"));
  objc_msgSend(v7, "setCorrectionType:", 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directionsFeedback"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "directionsCorrections"));

  if (!v9)
  {
    v9 = objc_alloc_init((Class)GEORPDirectionsCorrections);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directionsFeedback"));
    objc_msgSend(v10, "setDirectionsCorrections:", v9);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "instructionCorrections"));

  if (!v11)
  {
    v12 = objc_alloc_init((Class)NSMutableArray);
    objc_msgSend(v9, "setInstructionCorrections:", v12);

  }
  v13 = objc_alloc_init((Class)GEORPInstructionCorrection);
  if (v42)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directionsFeedback"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "directionsContext"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "problematicRouteIndexs"));
      v17 = objc_msgSend(v16, "count");

      if (v17 != (id)1)
        goto LABEL_16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "directionsFeedback"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "directionsContext"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "directionsResponses"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "firstObject"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "problematicRouteIndexs"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

      -[RAPInstructionCorrectionQuestion fillIndexesForResponse:problemAticRouteIndex:correction:](self, "fillIndexesForResponse:problemAticRouteIndex:correction:", v21, v23, v13);
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion comment](self, "comment"));
  objc_msgSend(v13, "setComments:", v24);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionCorrectionQuestion cellScreenshotImageData](self, "cellScreenshotImageData"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v25));

  v27 = [RAPPhoto alloc];
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v29 = -[RAPPhoto initWithPhoto:date:location:](v27, "initWithPhoto:date:location:", v26, v28, 0);

  v30 = -[RAPPhotoWithMetadata initWithRAPPhoto:photoType:]([RAPPhotoWithMetadata alloc], "initWithRAPPhoto:photoType:", v29, 3);
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoWithMetadata photoMetadata](v30, "photoMetadata"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "clientImageUuid"));
  objc_msgSend(v13, "setRouteStepScreenshotImageId:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
  objc_msgSend(v33, "addPhotoWithMetadata:", v30);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion photos](self, "photos"));
  v35 = objc_msgSend(v34, "count");

  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RAPCommentQuestion photos](self, "photos"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));

    v38 = -[RAPPhotoWithMetadata initWithRAPPhoto:photoType:]([RAPPhotoWithMetadata alloc], "initWithRAPPhoto:photoType:", v37, 4);
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    objc_msgSend(v39, "addPhotoWithMetadata:", v38);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPhotoWithMetadata photoMetadata](v38, "photoMetadata"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "clientImageUuid"));
    objc_msgSend(v13, "setPhotoId:", v41);

  }
  objc_msgSend(v9, "addInstructionCorrection:", v13);

LABEL_16:
}

- (void)fillIndexesForResponse:(id)a3 problemAticRouteIndex:(id)a4 correction:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  unsigned int v23;
  void *v24;
  unsigned int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  unsigned int v32;
  id v33;
  id v34;

  v34 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "suggestedRoutes"));
  if (v10
    && (v11 = (void *)v10,
        v12 = objc_msgSend(v8, "directionsResponseSuggestedRoutesIndex"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "suggestedRoutes")),
        v14 = objc_msgSend(v13, "count"),
        v13,
        v11,
        (unint64_t)v14 > v12))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "suggestedRoutes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v8, "directionsResponseSuggestedRoutesIndex")));

    v17 = -[TransitDirectionsListItem type](self->_listItem, "type");
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "steps"));
    v19 = v18;
    if (!v17)
    {
      objc_msgSend(v9, "setRouteStepIndex:", objc_msgSend(v18, "indexOfObjectPassingTest:", &stru_1011DC640));
LABEL_15:

      goto LABEL_16;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](self->_composedRouteStep, "transitStep"));
    v21 = objc_msgSend(v19, "indexOfObject:", v20);

    if (v21 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v9, "setRouteStepIndex:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](self->_composedRouteStep, "transitStep"));
      v23 = objc_msgSend(v22, "maneuverType");

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](self->_composedRouteStep, "transitStep"));
      v25 = objc_msgSend(v24, "hasWalkingIndex");

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListItem parentItem](self->_listItem, "parentItem"));
      if (v23 == 2 && v25 && ((objc_msgSend(v16, "isWalkingOnlyRoute") & 1) != 0 || v26))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "decoderData"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep transitStep](self->_composedRouteStep, "transitStep"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "walkingAtIndex:", objc_msgSend(v28, "walkingIndex")));

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "steps"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep geoStep](self->_composedRouteStep, "geoStep"));
        v31 = objc_msgSend(v29, "indexOfObject:", v30);

        if (v31 != (id)0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v9, "setRouteStepSubstepIndex:", v31);
        goto LABEL_15;
      }
    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRouteStep composedRoute](self->_composedRouteStep, "composedRoute"));
    v32 = objc_msgSend(v8, "directionsResponseSuggestedRoutesIndex");
    if (objc_msgSend(v16, "indexInResponse") == (id)v32)
    {
      v33 = -[GEOComposedRouteStep stepIndex](self->_composedRouteStep, "stepIndex");
      if (v33 != (id)0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v9, "setRouteStepIndex:", v33);
    }
  }
LABEL_16:

}

- (void)setCellScreenshotImageData:(id)a3
{
  NSData *v4;
  NSData *cellScreenshotImageData;

  if (self->_cellScreenshotImageData != a3)
  {
    v4 = (NSData *)objc_msgSend(a3, "copy");
    cellScreenshotImageData = self->_cellScreenshotImageData;
    self->_cellScreenshotImageData = v4;

  }
}

- (id)commentsTitle
{
  return +[RAPCommentQuestion _localizedMoreInformationTitle](RAPCommentQuestion, "_localizedMoreInformationTitle");
}

- (id)_commentsPlaceholderText
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Tell us more about this direction"), CFSTR("localized string not found"), 0));

  return v3;
}

- (RAPInstructionCorrectionQuestion)initWithReport:(id)a3 parentQuestion:(id)a4 composedRouteStep:(id)a5 listItem:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  RAPInstructionCorrectionQuestion *v16;
  objc_super v18;

  v11 = a5;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPInstructionCorrectionQuestion _commentsPlaceholderText](self, "_commentsPlaceholderText"));
  v18.receiver = self;
  v18.super_class = (Class)RAPInstructionCorrectionQuestion;
  v16 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](&v18, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v14, v13, 0, v15, 2);

  if (v16)
  {
    objc_storeStrong((id *)&v16->_listItem, a6);
    objc_storeStrong((id *)&v16->_composedRouteStep, a5);
  }

  return v16;
}

- (NSData)cellScreenshotImageData
{
  return self->_cellScreenshotImageData;
}

- (GEOComposedRouteStep)composedRouteStep
{
  return self->_composedRouteStep;
}

- (TransitDirectionsListItem)listItem
{
  return self->_listItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItem, 0);
  objc_storeStrong((id *)&self->_composedRouteStep, 0);
  objc_storeStrong((id *)&self->_cellScreenshotImageData, 0);
}

@end
