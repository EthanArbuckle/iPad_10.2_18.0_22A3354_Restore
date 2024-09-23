@implementation TransitPayModelData

- (id)analyticsValue
{
  id result;
  void *v4;
  id v5;
  void *v6;
  id v7;

  switch(-[TransitPayModelData suggestionType](self, "suggestionType"))
  {
    case 1:
      result = CFSTR("OPEN_LOOP_EXPRESS");
      break;
    case 2:
      result = CFSTR("OPEN_LOOP");
      break;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData paymentMethods](self, "paymentMethods"));
      v5 = objc_msgSend(v4, "count");

      if ((unint64_t)v5 <= 1)
      {
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData paymentMethods](self, "paymentMethods"));
        v7 = objc_msgSend(v6, "count");

        if (v7 == (id)1)
          result = CFSTR("CLOSED_LOOP_PROVISION_SINGLE");
        else
          result = 0;
      }
      else
      {
        result = CFSTR("CLOSED_LOOP_PROVISION_MULTIPLE");
      }
      break;
    case 4:
      result = CFSTR("INTEROPERABLE");
      break;
    case 5:
      if (-[TransitPayModelData isForRemoteDevice](self, "isForRemoteDevice"))
        result = CFSTR("CLOSED_LOOP_TOP_UP_WATCH");
      else
        result = CFSTR("CLOSED_LOOP_TOP_UP_PHONE");
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 suggestionType:(int)a7 paymentMethods:(id)a8 educationScreenTitle:(id)a9 educationScreenAssetURLs:(id)a10 educationScreenText:(id)a11 topUpPassUniqueID:(id)a12 isForRemoteDevice:(BOOL)a13
{
  id v19;
  TransitPayModelData *v20;
  TransitPayModelData *v21;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a8;
  v26 = a9;
  v25 = a10;
  v24 = a11;
  v19 = a12;
  v32.receiver = self;
  v32.super_class = (Class)TransitPayModelData;
  v20 = -[TransitPayModelData init](&v32, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_title, a3);
    objc_storeStrong((id *)&v21->_subtitle, a4);
    objc_storeStrong((id *)&v21->_actionTitle, a5);
    objc_storeStrong((id *)&v21->_image, a6);
    v21->_suggestionType = a7;
    objc_storeStrong((id *)&v21->_paymentMethods, a8);
    objc_storeStrong((id *)&v21->_educationScreenTitle, a9);
    objc_storeStrong((id *)&v21->_educationScreenAssetURLs, a10);
    objc_storeStrong((id *)&v21->_educationScreenText, a11);
    objc_storeStrong((id *)&v21->_topUpPassUniqueID, a12);
    v21->_isForRemoteDevice = a13;
  }

  return v21;
}

- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 suggestionType:(int)a7 paymentMethods:(id)a8
{
  uint64_t v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  TransitPayModelData *v19;
  uint64_t v21;

  v8 = *(_QWORD *)&a7;
  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  LOBYTE(v21) = 0;
  v19 = -[TransitPayModelData initWithTitle:subtitle:actionTitle:image:suggestionType:paymentMethods:educationScreenTitle:educationScreenAssetURLs:educationScreenText:topUpPassUniqueID:isForRemoteDevice:]([TransitPayModelData alloc], "initWithTitle:subtitle:actionTitle:image:suggestionType:paymentMethods:educationScreenTitle:educationScreenAssetURLs:educationScreenText:topUpPassUniqueID:isForRemoteDevice:", v18, v17, v16, v15, v8, v14, 0, 0, 0, 0, v21);

  return v19;
}

- (TransitPayModelData)initWithTitle:(id)a3 subtitle:(id)a4 actionTitle:(id)a5 image:(id)a6 paymentMethod:(id)a7 topUpPassUniqueID:(id)a8 isForRemoteDevice:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  TransitPayModelData *v21;
  void *v22;
  TransitPayModelData *v23;
  uint64_t v25;
  id v26;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = [TransitPayModelData alloc];
  v26 = v16;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));

  LOBYTE(v25) = a9;
  v23 = -[TransitPayModelData initWithTitle:subtitle:actionTitle:image:suggestionType:paymentMethods:educationScreenTitle:educationScreenAssetURLs:educationScreenText:topUpPassUniqueID:isForRemoteDevice:](v21, "initWithTitle:subtitle:actionTitle:image:suggestionType:paymentMethods:educationScreenTitle:educationScreenAssetURLs:educationScreenText:topUpPassUniqueID:isForRemoteDevice:", v20, v19, v18, v17, 5, v22, 0, 0, 0, v15, v25);

  return v23;
}

- (BOOL)canPresentEducationScreen
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData educationScreenText](self, "educationScreenText"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData educationScreenTitle](self, "educationScreenTitle"));
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)hasAllNeededText
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData title](self, "title"));
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData subtitle](self, "subtitle"));
    if (objc_msgSend(v4, "length"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData actionTitle](self, "actionTitle"));
      v6 = objc_msgSend(v5, "length") != 0;

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  const __CFString *v19;
  id v20;
  CGSize v22;

  v3 = objc_alloc_init((Class)NSMutableString);
  objc_msgSend(v3, "appendFormat:", CFSTR(" TransitPayModelData:\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData title](self, "title"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" title:              '%@'\n"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData subtitle](self, "subtitle"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" subtitle:           '%@'\n"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData actionTitle](self, "actionTitle"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" actionTitle:        '%@'\n"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData image](self, "image"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData image](self, "image"));
  objc_msgSend(v8, "size");
  v9 = NSStringFromCGSize(v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v3, "appendFormat:", CFSTR(" image:              '%x, size:%@'\n"), v7, v10);

  v11 = -[TransitPayModelData suggestionType](self, "suggestionType") - 1;
  if (v11 > 4)
    v12 = CFSTR("Unknown");
  else
    v12 = *(&off_1011B5650 + (int)v11);
  objc_msgSend(v3, "appendFormat:", CFSTR(" suggestionType:     '%@'\n"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData paymentMethods](self, "paymentMethods"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" paymentMethods:     '%@'\n"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData educationScreenTitle](self, "educationScreenTitle"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" eduScreenTitle:     '%@'\n"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData educationScreenAssetURLs](self, "educationScreenAssetURLs"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" imageURLs:          '%@'\n"), v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData educationScreenText](self, "educationScreenText"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" eduScreenText:      '%@'\n"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitPayModelData topUpPassUniqueID](self, "topUpPassUniqueID"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" topUpUniqueID:      '%@'\n"), v17);

  v18 = -[TransitPayModelData isForRemoteDevice](self, "isForRemoteDevice");
  v19 = CFSTR("NO");
  if (v18)
    v19 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR(" isForRemoteDevice:  '%@'\n"), v19);
  v20 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", v3);

  return v20;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)actionTitle
{
  return self->_actionTitle;
}

- (UIImage)image
{
  return self->_image;
}

- (int)suggestionType
{
  return self->_suggestionType;
}

- (NSString)educationScreenTitle
{
  return self->_educationScreenTitle;
}

- (NSArray)educationScreenAssetURLs
{
  return self->_educationScreenAssetURLs;
}

- (NSString)educationScreenText
{
  return self->_educationScreenText;
}

- (NSArray)paymentMethods
{
  return self->_paymentMethods;
}

- (NSString)topUpPassUniqueID
{
  return self->_topUpPassUniqueID;
}

- (BOOL)isForRemoteDevice
{
  return self->_isForRemoteDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topUpPassUniqueID, 0);
  objc_storeStrong((id *)&self->_paymentMethods, 0);
  objc_storeStrong((id *)&self->_educationScreenText, 0);
  objc_storeStrong((id *)&self->_educationScreenAssetURLs, 0);
  objc_storeStrong((id *)&self->_educationScreenTitle, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
