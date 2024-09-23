@implementation WFFinderConvertImageContextualAction

- (WFFinderConvertImageContextualAction)init
{
  void *v3;
  void *v4;
  void *v5;
  WFContextualActionParameter *v6;
  WFContextualActionParameter *v7;
  void *v8;
  void *v9;
  WFFinderConvertImageContextualAction *v10;
  uint64_t v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  WFLocalizedString(CFSTR("Convert Image"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CEC520]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContextualActionFilteringBehavior filteringWithMatchingTypes:predicate:](WFContextualActionFilteringBehavior, "filteringWithMatchingTypes:predicate:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:askEachTime:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:askEachTime:", CFSTR("WFNumberContentItem"), 0, CFSTR("WFSize"), 1);
  v13[0] = v6;
  v7 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:askEachTime:]([WFContextualActionParameter alloc], "initWithType:displayString:wfParameterKey:askEachTime:", CFSTR("WFNumberContentItem"), 0, CFSTR("WFFileFormat"), 1);
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[WFContextualActionIcon iconWithSystemName:](WFContextualActionIcon, "iconWithSystemName:", CFSTR("photo.on.rectangle.angled"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v12) = 0;
  v10 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:](self, "initWithIdentifier:wfActionIdentifier:type:correspondingSystemActionType:associatedAppBundleIdentifier:resultFileOperation:alternate:filteringBehavior:parameters:displayFormatString:title:subtitleFormatString:icon:", CFSTR("is.workflow.actions.image.convert.finder"), CFSTR("is.workflow.actions.image.convert.finder"), 0, 9, CFSTR("com.apple.mobileslideshow"), 1, v12, v5, v8, v3, v3, 0, v9, v13[0]);

  return v10;
}

- (id)copyWithFormat:(unint64_t)a3 resizeSize:(unint64_t)a4 preserveMetadata:(BOOL)a5
{
  _BOOL8 v5;
  WFContextualActionParameter *v9;
  __CFString *v10;
  __CFString *v11;
  WFContextualActionParameter *v12;
  WFContextualActionParameter *v13;
  __CFString *v14;
  __CFString *v15;
  WFContextualActionParameter *v16;
  WFContextualActionParameter *v17;
  void *v18;
  WFContextualActionParameter *v19;
  void *v20;
  id v21;
  _QWORD v23[4];

  v5 = a5;
  v23[3] = *MEMORY[0x1E0C80C00];
  v9 = [WFContextualActionParameter alloc];
  v10 = CFSTR("JPEG");
  if (a3 == 1)
    v10 = CFSTR("PNG");
  if (a3 == 2)
    v10 = CFSTR("HEIF");
  v11 = v10;
  v12 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v9, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, CFSTR("WFFileFormat"), v11);

  v13 = [WFContextualActionParameter alloc];
  if (a4 > 2)
    v14 = CFSTR("Small");
  else
    v14 = *(&off_1E5FC88C0 + a4);
  v15 = v14;
  v16 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v13, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, CFSTR("WFSize"), v15);

  v17 = [WFContextualActionParameter alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[WFContextualActionParameter initWithType:displayString:wfParameterKey:wfSerializedRepresentation:](v17, "initWithType:displayString:wfParameterKey:wfSerializedRepresentation:", CFSTR("WFNumberContentItem"), 0, CFSTR("WFPreserveMetadata"), v18);

  v23[0] = v12;
  v23[1] = v16;
  v23[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[WFContextualAction copyWithParameters:](self, "copyWithParameters:", v20);

  return v21;
}

@end
