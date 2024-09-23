@implementation TFFeedbackFormCellUpdater

- (void)updateCell:(id)a3 displayingEntry:(id)a4 contentDataSource:(id)a5 updateProxy:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v14, "applyContentsOfEntry:", v9);
  objc_msgSend(v14, "prepareSeparatorsForCellInSectionLocation:", objc_msgSend(v14, "sectionLocation"));
  switch(objc_msgSend(v14, "displayableDataType"))
  {
    case 0:
      objc_msgSend(v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringForIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDisplayedDataString:", v13);
      goto LABEL_6;
    case 1:
      objc_msgSend(v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "numberForIdentifier:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDisplayedDataNumber:", v13);
      goto LABEL_6;
    case 2:
      objc_msgSend(v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDisplayedDataGroupInclusionBool:", objc_msgSend(v10, "isGroupWithIdentifierIncluded:", v12));
      goto LABEL_7;
    case 3:
      objc_msgSend(v9, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "imageCollectionForIdentifer:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setDisplayedDataImageCollection:", v13);
LABEL_6:

LABEL_7:
      break;
    default:
      break;
  }
  objc_msgSend(v14, "setUpdateProxy:", v11);

}

@end
