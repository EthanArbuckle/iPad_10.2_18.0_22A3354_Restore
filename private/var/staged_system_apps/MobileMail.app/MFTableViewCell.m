@implementation MFTableViewCell

+ (double)defaultAccessoryWidth
{
  return 25.0;
}

+ (double)reorderingAccessoryWidth
{
  return 35.0;
}

- (double)accessoryWidth
{
  double v3;
  double v4;

  if (!-[MFTableViewCell isEditing](self, "isEditing"))
  {
    if (-[MFTableViewCell accessoryType](self, "accessoryType"))
      goto LABEL_3;
LABEL_5:
    v4 = 0.0;
    goto LABEL_6;
  }
  if (!-[MFTableViewCell editingAccessoryType](self, "editingAccessoryType"))
    goto LABEL_5;
LABEL_3:
  objc_msgSend((id)objc_opt_class(self), "defaultAccessoryWidth");
  v4 = v3;
LABEL_6:
  if (-[MFTableViewCell isEditing](self, "isEditing")
    && -[MFTableViewCell showsReorderControl](self, "showsReorderControl"))
  {
    return v4 + 35.0;
  }
  return v4;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFTableViewCell;
  -[MFTableViewCell prepareForReuse](&v3, "prepareForReuse");
  -[MFTableViewCell setDisabled:](self, "setDisabled:", 0);
}

- (void)willTransitionToState:(unint64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MFTableViewCell;
  -[MFTableViewCell willTransitionToState:](&v5, "willTransitionToState:");
  if (-[MFTableViewCell shouldDisableWhileEditing](self, "shouldDisableWhileEditing"))
    -[MFTableViewCell setDisabled:](self, "setDisabled:", a3 != 0);
}

- (BOOL)disabled
{
  return -[MFTableViewCell isUserInteractionEnabled](self, "isUserInteractionEnabled") ^ 1;
}

- (void)setDisabled:(BOOL)a3
{
  _BOOL8 v4;

  v4 = !a3;
  -[MFTableViewCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v4);
  -[MFTableViewCell setSelectionStyle:](self, "setSelectionStyle:", v4);
}

- (BOOL)shouldDisableWhileEditing
{
  return self->_shouldDisableWhileEditing;
}

- (void)setShouldDisableWhileEditing:(BOOL)a3
{
  self->_shouldDisableWhileEditing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedTextColor, 0);
}

@end
