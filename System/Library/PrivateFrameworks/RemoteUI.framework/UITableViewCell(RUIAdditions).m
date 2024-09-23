@implementation UITableViewCell(RUIAdditions)

- (id)ruiTextLabel
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    objc_msgSend(a1, "customTextLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(a1, "textLabel");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    goto LABEL_5;
  }
  objc_msgSend(a1, "customLinkTextLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

- (id)ruiDetailTextLabel
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "customDetailTextLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "effectiveDetailTextLabel");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(a1, "customLinkDetailTextLabel");
      else
        objc_msgSend(a1, "detailTextLabel");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

- (id)ruiValueLabel
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "customValueLabel");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "effectiveValueTextLabel");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(a1, "customLinkSubLabel");
        v2 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v2 = 0;
      }
    }
  }
  return v2;
}

- (id)ruiEditableTextField
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "customEditableTextField");
  else
    objc_msgSend(a1, "editableTextField");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ruiImageView
{
  void *v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_5:
    objc_msgSend(a1, "customImageView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    return v2;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(a1, "imageView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    goto LABEL_5;
  }
  objc_msgSend(a1, "customLinkImageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

@end
