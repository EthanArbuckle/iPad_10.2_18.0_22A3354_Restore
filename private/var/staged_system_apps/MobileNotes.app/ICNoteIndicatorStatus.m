@implementation ICNoteIndicatorStatus

- (ICNoteIndicatorStatus)initWithStatusType:(int64_t)a3 isDisplayedInFolder:(BOOL)a4
{
  ICNoteIndicatorStatus *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICNoteIndicatorStatus;
  result = -[ICNoteIndicatorStatus init](&v7, "init");
  if (result)
  {
    result->_statusType = a3;
    result->_isDisplayedInFolder = a4;
  }
  return result;
}

- (NSString)imageName
{
  NSString *result;
  unsigned int v4;
  __CFString *v5;
  __CFString *v6;

  switch(-[ICNoteIndicatorStatus statusType](self, "statusType"))
  {
    case 1:
      result = CFSTR("lock.fill");
      break;
    case 2:
      result = CFSTR("lock.open.fill");
      break;
    case 3:
      result = CFSTR("person.crop.circle");
      break;
    case 4:
      v4 = -[ICNoteIndicatorStatus isDisplayedInFolder](self, "isDisplayedInFolder");
      v5 = CFSTR("person.crop.circle");
      if (v4)
        v5 = 0;
      v6 = v5;
      result = v6;
      break;
    default:
      result = (NSString *)0;
      break;
  }
  return result;
}

- (UIColor)tintColor
{
  return +[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor");
}

- (int64_t)statusType
{
  return self->_statusType;
}

- (BOOL)isDisplayedInFolder
{
  return self->_isDisplayedInFolder;
}

- (void)setIsDisplayedInFolder:(BOOL)a3
{
  self->_isDisplayedInFolder = a3;
}

@end
