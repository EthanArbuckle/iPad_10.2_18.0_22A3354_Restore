@implementation RAPLabelCorrectionsQuestion

- (NSString)localizedLabelMarkerPickingPrompt
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Choose a road or place to rename [Report a Problem iOS]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Map Labels [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (NSString)localizedDescription
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Map Description [Report an Issue category]"), CFSTR("localized string not found"), 0));

  return (NSString *)v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes addressMarkerStyleAttributes](GEOFeatureStyleAttributes, "addressMarkerStyleAttributes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "scale");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v2, 3, 0));

  if (!v4)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("RAPMapErrors")));
  return (UIImage *)v4;
}

- (int)analyticTarget
{
  return 1127;
}

- (int64_t)questionCategory
{
  return 8;
}

- ($C79183323B9A0D5602617FF3BE5395AC)initialLabelMarkerPickingMapRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  $C79183323B9A0D5602617FF3BE5395AC result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
  v3 = sub_10043C9E4(v2);
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = v3;
  v11 = v5;
  v12 = v7;
  v13 = v9;
  result.var1.var1 = v13;
  result.var1.var0 = v12;
  result.var0.var1 = v11;
  result.var0.var0 = v10;
  return result;
}

- (BOOL)isNameCorrectionRequired
{
  return 0;
}

- (NSString)originalName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion labelMarker](self, "labelMarker"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "text"));

  return (NSString *)v3;
}

- (void)setCorrectedName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion correctableName](self, "correctableName"));
  objc_msgSend(v5, "setValue:", v4);

}

- (RAPPlaceCorrectableString)correctableName
{
  RAPPlaceCorrectableString *correctableName;
  void *v4;
  void *v5;
  void *v6;
  RAPPlaceCorrectableString *v7;
  RAPPlaceCorrectableString *v8;

  correctableName = self->_correctableName;
  if (!correctableName)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion labelMarker](self, "labelMarker"));
    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion labelMarker](self, "labelMarker"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));

    }
    else
    {
      v6 = 0;
    }

    v7 = -[RAPPlaceCorrectableString initWithKind:originalValue:]([RAPPlaceCorrectableString alloc], "initWithKind:originalValue:", 0, v6);
    v8 = self->_correctableName;
    self->_correctableName = v7;

    -[RAPPlaceCorrectableString addObserver:changeHandler:](self->_correctableName, "addObserver:changeHandler:", self, &stru_1011B1338);
    correctableName = self->_correctableName;
  }
  return correctableName;
}

- (RAPPlaceCorrectableFlag)removeLabelCorrectableFlag
{
  RAPPlaceCorrectableFlag *removeLabelCorrectableFlag;
  RAPPlaceCorrectableFlag *v4;
  RAPPlaceCorrectableFlag *v5;
  RAPPlaceCorrectableFlag *v6;

  removeLabelCorrectableFlag = self->_removeLabelCorrectableFlag;
  if (!removeLabelCorrectableFlag)
  {
    v4 = [RAPPlaceCorrectableFlag alloc];
    v5 = -[RAPPlaceCorrectableFlag initWithKind:originalValue:](v4, "initWithKind:originalValue:", qword_1014A5BC8, 0);
    v6 = self->_removeLabelCorrectableFlag;
    self->_removeLabelCorrectableFlag = v5;

    -[RAPPlaceCorrectableFlag addObserver:changeHandler:](self->_removeLabelCorrectableFlag, "addObserver:changeHandler:", self, &stru_1011B1358);
    removeLabelCorrectableFlag = self->_removeLabelCorrectableFlag;
  }
  return removeLabelCorrectableFlag;
}

- (void)setLabelMarker:(id)a3
{
  VKLabelMarker *v5;
  RAPPlaceCorrectableString *correctableName;
  VKLabelMarker *v7;

  v5 = (VKLabelMarker *)a3;
  if (self->_labelMarker != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_labelMarker, a3);
    correctableName = self->_correctableName;
    self->_correctableName = 0;

    -[RAPQuestion _didChange](self, "_didChange");
    v5 = v7;
  }

}

- (void)setLabelMarkerPickingMapContext:(id)a3
{
  RAPMapStateProtocol *v5;
  RAPMapStateProtocol *v6;

  v5 = (RAPMapStateProtocol *)a3;
  if (self->_labelMarkerPickingMapContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_labelMarkerPickingMapContext, a3);
    v5 = v6;
  }

}

- (BOOL)isComplete
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;

  v3 = objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion labelMarker](self, "labelMarker"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion labelMarkerPickingMapContext](self, "labelMarkerPickingMapContext"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion correctableName](self, "correctableName"));
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "value"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "stringByTrimmingCharactersInSet:", v8));
      v10 = objc_msgSend(v9, "length");
      LOBYTE(v5) = v10 != 0;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion removeLabelCorrectableFlag](self, "removeLabelCorrectableFlag"));
      LOBYTE(v7) = objc_msgSend(v11, "value");

      if ((v7 & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion correctableName](self, "correctableName"));
        v13 = objc_msgSend(v12, "isEdited");
        if (v10)
          v14 = v13;
        else
          v14 = 0;

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion commentQuestion](self, "commentQuestion"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "comment"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTrimmingCharactersInSet:", v16));
        if (objc_msgSend(v17, "length"))
        {
          v18 = 1;
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion commentQuestion](self, "commentQuestion"));
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "photos"));
          v18 = objc_msgSend(v20, "count") != 0;

        }
        LOBYTE(v5) = v14 | v18;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (void)_fillSubmissionParameters:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  uint64_t v22;
  void *v23;
  id v24;

  v24 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "commonContext"));

  if (!v4)
  {
    v5 = (void *)objc_opt_new(GEORPFeedbackCommonContext);
    objc_msgSend(v24, "setCommonContext:", v5);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "commonContext"));
  objc_msgSend(v6, "addUserPath:", 6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "commonContext"));
  objc_msgSend(v7, "addUserPath:", 4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "details"));
  if (!v8)
  {
    v9 = (void *)objc_opt_new(GEORPFeedbackDetails);
    objc_msgSend(v24, "setDetails:", v9);

  }
  objc_msgSend(v24, "setType:", 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "details"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tileFeedback"));

  if (!v11)
  {
    v11 = (void *)objc_opt_new(GEORPTileFeedback);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "details"));
    objc_msgSend(v12, "setTileFeedback:", v11);

  }
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "label"));
  if (!v13)
  {
    v13 = objc_alloc_init((Class)GEORPCorrectedLabel);
    objc_msgSend(v11, "setLabel:", v13);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion labelMarker](self, "labelMarker"));
  objc_msgSend(v13, "populateWithLabelMarker:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion correctableName](self, "correctableName"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "originalValue"));
  objc_msgSend(v13, "setOriginalValue:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion correctableName](self, "correctableName"));
  LODWORD(v16) = objc_msgSend(v17, "isEdited");

  if ((_DWORD)v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion correctableName](self, "correctableName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "value"));
    objc_msgSend(v13, "setCorrectedValue:", v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion removeLabelCorrectableFlag](self, "removeLabelCorrectableFlag"));
  v21 = objc_msgSend(v20, "value");

  if (v21)
    v22 = 2;
  else
    v22 = 1;
  objc_msgSend(v11, "setType:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RAPLabelCorrectionsQuestion commentQuestion](self, "commentQuestion"));
  objc_msgSend(v23, "_fillSubmissionParameters:", v24);

}

- (RAPCommentQuestion)commentQuestion
{
  RAPCommentQuestion *commentQuestion;
  RAPCommentQuestion *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  RAPCommentQuestion *v9;
  RAPCommentQuestion *v10;

  commentQuestion = self->_commentQuestion;
  if (!commentQuestion)
  {
    v4 = [RAPCommentQuestion alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion report](self, "report"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[RAPCommentQuestion _localizedOptionalInformationTitle](RAPCommentQuestion, "_localizedOptionalInformationTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Add more information about the incorrect label"), CFSTR("localized string not found"), 0));
    v9 = -[RAPCommentQuestion initWithReport:parentQuestion:title:placeholderText:emphasis:](v4, "initWithReport:parentQuestion:title:placeholderText:emphasis:", v5, self, v6, v8, 0);
    v10 = self->_commentQuestion;
    self->_commentQuestion = v9;

    commentQuestion = self->_commentQuestion;
  }
  return commentQuestion;
}

- (unint64_t)coordinatePickingMapType
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPQuestion _context](self, "_context"));
  v3 = objc_msgSend(v2, "mapType");

  return (unint64_t)v3;
}

- (int)userAction
{
  return 10116;
}

- (VKLabelMarker)labelMarker
{
  return self->_labelMarker;
}

- (RAPMapStateProtocol)labelMarkerPickingMapContext
{
  return self->_labelMarkerPickingMapContext;
}

- (NSString)localizedServerControlledDescription
{
  return self->_localizedServerControlledDescription;
}

- (void)setLocalizedServerControlledDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeLabelCorrectableFlag, 0);
  objc_storeStrong((id *)&self->_localizedServerControlledDescription, 0);
  objc_storeStrong((id *)&self->_labelMarkerPickingMapContext, 0);
  objc_storeStrong((id *)&self->_commentQuestion, 0);
  objc_storeStrong((id *)&self->_labelMarker, 0);
  objc_storeStrong((id *)&self->_correctableName, 0);
}

@end
