@implementation _TransitDirectionsInstructionsCellConstraints

- (void)deactivateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints minimumCellHeightConstraint](self, "minimumCellHeightConstraint"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints minimumCellHeightConstraint](self, "minimumCellHeightConstraint"));
    objc_msgSend(v30, "addObject:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints topToPrimaryConstraint](self, "topToPrimaryConstraint"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints topToPrimaryConstraint](self, "topToPrimaryConstraint"));
    objc_msgSend(v30, "addObject:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints contentLayoutGuideToPrimaryLeadingConstraint](self, "contentLayoutGuideToPrimaryLeadingConstraint"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints contentLayoutGuideToPrimaryLeadingConstraint](self, "contentLayoutGuideToPrimaryLeadingConstraint"));
    objc_msgSend(v30, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryBaselineToBottomConstraint](self, "primaryBaselineToBottomConstraint"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryBaselineToBottomConstraint](self, "primaryBaselineToBottomConstraint"));
    objc_msgSend(v30, "addObject:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryToSecondaryAccessoryConstraint](self, "primaryAccessoryToSecondaryAccessoryConstraint"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryToSecondaryAccessoryConstraint](self, "primaryAccessoryToSecondaryAccessoryConstraint"));
    objc_msgSend(v30, "addObject:", v12);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkBottomToBottomConstraint](self, "platformArtworkBottomToBottomConstraint"));

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkBottomToBottomConstraint](self, "platformArtworkBottomToBottomConstraint"));
    objc_msgSend(v30, "addObject:", v14);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkTrailingToTextStackLabelLeadingConstraint](self, "platformArtworkTrailingToTextStackLabelLeadingConstraint"));

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints platformArtworkTrailingToTextStackLabelLeadingConstraint](self, "platformArtworkTrailingToTextStackLabelLeadingConstraint"));
    objc_msgSend(v30, "addObject:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints textStackLeadingToPrimaryLabelLeadingConstraint](self, "textStackLeadingToPrimaryLabelLeadingConstraint"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints textStackLeadingToPrimaryLabelLeadingConstraint](self, "textStackLeadingToPrimaryLabelLeadingConstraint"));
    objc_msgSend(v30, "addObject:", v18);

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint](self, "secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint](self, "secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint"));
    objc_msgSend(v30, "addObject:", v20);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryLabelTrailingToTrailingContentConstraint](self, "primaryLabelTrailingToTrailingContentConstraint"));

  if (v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryLabelTrailingToTrailingContentConstraint](self, "primaryLabelTrailingToTrailingContentConstraint"));
    objc_msgSend(v30, "addObject:", v22);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints secondaryLabelTrailingToTrailingContentConstraint](self, "secondaryLabelTrailingToTrailingContentConstraint"));

  if (v23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints secondaryLabelTrailingToTrailingContentConstraint](self, "secondaryLabelTrailingToTrailingContentConstraint"));
    objc_msgSend(v30, "addObject:", v24);

  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryToTrailingConstraint](self, "primaryAccessoryToTrailingConstraint"));

  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryToTrailingConstraint](self, "primaryAccessoryToTrailingConstraint"));
    objc_msgSend(v30, "addObject:", v26);

  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryMaximumWidthFactorConstraint](self, "primaryAccessoryMaximumWidthFactorConstraint"));

  if (v27)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints primaryAccessoryMaximumWidthFactorConstraint](self, "primaryAccessoryMaximumWidthFactorConstraint"));
    objc_msgSend(v30, "addObject:", v28);

  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[_TransitDirectionsInstructionsCellConstraints initialConstraints](self, "initialConstraints"));
  objc_msgSend(v30, "addObjectsFromArray:", v29);

  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v30);
}

- (void)dealloc
{
  objc_super v3;

  -[_TransitDirectionsInstructionsCellConstraints deactivateConstraints](self, "deactivateConstraints");
  v3.receiver = self;
  v3.super_class = (Class)_TransitDirectionsInstructionsCellConstraints;
  -[_TransitDirectionsInstructionsCellConstraints dealloc](&v3, "dealloc");
}

- (NSLayoutConstraint)minimumCellHeightConstraint
{
  return self->_minimumCellHeightConstraint;
}

- (void)setMinimumCellHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_minimumCellHeightConstraint, a3);
}

- (NSLayoutConstraint)topToPrimaryConstraint
{
  return self->_topToPrimaryConstraint;
}

- (void)setTopToPrimaryConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topToPrimaryConstraint, a3);
}

- (NSLayoutConstraint)contentLayoutGuideToPrimaryLeadingConstraint
{
  return self->_contentLayoutGuideToPrimaryLeadingConstraint;
}

- (void)setContentLayoutGuideToPrimaryLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_contentLayoutGuideToPrimaryLeadingConstraint, a3);
}

- (NSLayoutConstraint)primaryBaselineToBottomConstraint
{
  return self->_primaryBaselineToBottomConstraint;
}

- (void)setPrimaryBaselineToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryBaselineToBottomConstraint, a3);
}

- (NSLayoutConstraint)primaryAccessoryToSecondaryAccessoryConstraint
{
  return self->_primaryAccessoryToSecondaryAccessoryConstraint;
}

- (void)setPrimaryAccessoryToSecondaryAccessoryConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessoryToSecondaryAccessoryConstraint, a3);
}

- (NSLayoutConstraint)platformArtworkBottomToBottomConstraint
{
  return self->_platformArtworkBottomToBottomConstraint;
}

- (void)setPlatformArtworkBottomToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_platformArtworkBottomToBottomConstraint, a3);
}

- (NSLayoutConstraint)platformArtworkTrailingToTextStackLabelLeadingConstraint
{
  return self->_platformArtworkTrailingToTextStackLabelLeadingConstraint;
}

- (void)setPlatformArtworkTrailingToTextStackLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_platformArtworkTrailingToTextStackLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)textStackLeadingToPrimaryLabelLeadingConstraint
{
  return self->_textStackLeadingToPrimaryLabelLeadingConstraint;
}

- (void)setTextStackLeadingToPrimaryLabelLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_textStackLeadingToPrimaryLabelLeadingConstraint, a3);
}

- (NSLayoutConstraint)secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint
{
  return self->_secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint;
}

- (void)setSecondaryLabelFirstBaselineToPlatformArtworkBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint, a3);
}

- (NSLayoutConstraint)primaryLabelTrailingToTrailingContentConstraint
{
  return self->_primaryLabelTrailingToTrailingContentConstraint;
}

- (void)setPrimaryLabelTrailingToTrailingContentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryLabelTrailingToTrailingContentConstraint, a3);
}

- (NSLayoutConstraint)secondaryLabelTrailingToTrailingContentConstraint
{
  return self->_secondaryLabelTrailingToTrailingContentConstraint;
}

- (void)setSecondaryLabelTrailingToTrailingContentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryLabelTrailingToTrailingContentConstraint, a3);
}

- (NSLayoutConstraint)primaryAccessoryToTrailingConstraint
{
  return self->_primaryAccessoryToTrailingConstraint;
}

- (void)setPrimaryAccessoryToTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessoryToTrailingConstraint, a3);
}

- (NSLayoutConstraint)primaryAccessoryMaximumWidthFactorConstraint
{
  return self->_primaryAccessoryMaximumWidthFactorConstraint;
}

- (void)setPrimaryAccessoryMaximumWidthFactorConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_primaryAccessoryMaximumWidthFactorConstraint, a3);
}

- (NSArray)initialConstraints
{
  return self->_initialConstraints;
}

- (void)setInitialConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialConstraints, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryMaximumWidthFactorConstraint, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryToTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelTrailingToTrailingContentConstraint, 0);
  objc_storeStrong((id *)&self->_primaryLabelTrailingToTrailingContentConstraint, 0);
  objc_storeStrong((id *)&self->_secondaryLabelFirstBaselineToPlatformArtworkBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textStackLeadingToPrimaryLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_platformArtworkTrailingToTextStackLabelLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_platformArtworkBottomToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_primaryAccessoryToSecondaryAccessoryConstraint, 0);
  objc_storeStrong((id *)&self->_primaryBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_contentLayoutGuideToPrimaryLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_topToPrimaryConstraint, 0);
  objc_storeStrong((id *)&self->_minimumCellHeightConstraint, 0);
}

@end
