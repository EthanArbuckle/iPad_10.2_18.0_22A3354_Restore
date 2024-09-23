@implementation PKPassTileView_State

+ (uint64_t)visuallyCompareTile:(void *)a3 toTile:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  if (v4 == v5)
  {
    v6 = 2;
  }
  else if ((v4 != 0) != (v5 != 0))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v4, "metadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "metadata");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7 == (void *)v8)
      goto LABEL_12;
    if ((v7 != 0) != (v8 != 0))
      goto LABEL_7;
    if (!v7)
      goto LABEL_12;
    if (!v8)
      goto LABEL_12;
    v10 = objc_msgSend(v7, "isSelectable");
    if (v10 != objc_msgSend(v9, "isSelectable")
      || (objc_msgSend(v7, "identifier"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "identifier"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = PKEqualObjects(),
          v12,
          v11,
          !v13))
    {
LABEL_7:
      v6 = 0;
    }
    else
    {
LABEL_12:
      objc_msgSend(v4, "stateIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stateIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (PKEqualObjects())
        v6 = 2;
      else
        v6 = 1;

    }
  }

  return v6;
}

- (PKPassTileView_State)init
{

  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedView, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_bodyImageImage, 0);
  objc_storeStrong((id *)&self->_bodyImage, 0);
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_secondaryImage, 0);
  objc_storeStrong((id *)&self->_secondaryAccessory, 0);
  objc_storeStrong((id *)&self->_accessoryImage, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_iconImage, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_source, 0);
}

@end
