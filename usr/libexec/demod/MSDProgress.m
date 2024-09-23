@implementation MSDProgress

+ (id)progressWithStage:(int)a3 percent:(int64_t)a4
{
  MSDProgress *v6;
  MSDProgress *v7;

  v6 = objc_alloc_init(MSDProgress);
  v7 = v6;
  if (v6)
  {
    -[MSDProgress setStage:](v6, "setStage:", a3);
    -[MSDProgress setPercent:](v7, "setPercent:", a4);
  }
  return v7;
}

+ (id)progressWithStage:(int)a3
{
  return objc_msgSend(a1, "progressWithStage:percent:", *(_QWORD *)&a3, 0);
}

- (NSString)stageDescription
{
  int64_t v2;
  NSString *result;

  v2 = -[MSDProgress stage](self, "stage");
  result = (NSString *)CFSTR("Rebooting to turn off snapshot");
  switch(v2)
  {
    case 0:
      return result;
    case 1:
      result = (NSString *)CFSTR("Enrolling with server");
      break;
    case 2:
      result = (NSString *)CFSTR("Downloading manifest");
      break;
    case 3:
      result = (NSString *)CFSTR("Updating general configuration");
      break;
    case 4:
      result = (NSString *)CFSTR("Updating apps");
      break;
    case 5:
      result = (NSString *)CFSTR("Updating app data");
      break;
    case 6:
      result = (NSString *)CFSTR("Rebooting to install content");
      break;
    case 7:
      result = (NSString *)CFSTR("Preparing for snapshot");
      break;
    case 8:
      result = (NSString *)CFSTR("Rebooting to turn on snapshot");
      break;
    case 9:
      result = (NSString *)CFSTR("Rebooting to reset content");
      break;
    case 10:
      result = (NSString *)CFSTR("Will start content update");
      break;
    case 11:
      result = (NSString *)CFSTR("Scanning existing general configuration");
      break;
    case 12:
      result = (NSString *)CFSTR("Downloading media library");
      break;
    case 13:
      result = (NSString *)CFSTR("Downloading preferences data");
      break;
    case 14:
      result = (NSString *)CFSTR("Migrating data");
      break;
    case 15:
      result = (NSString *)CFSTR("Migrating app data");
      break;
    case 16:
      result = (NSString *)CFSTR("Waiting at setup");
      break;
    case 17:
      result = (NSString *)CFSTR("Pricing app is updating its content");
      break;
    case 18:
      result = (NSString *)CFSTR("Downloading iOS update");
      break;
    case 19:
      result = (NSString *)CFSTR("Installing iOS update");
      break;
    case 20:
      result = (NSString *)CFSTR("Setting up accounts");
      break;
    case 21:
      result = (NSString *)CFSTR("Prepare to install apps");
      break;
    case 22:
      result = (NSString *)CFSTR("Updating demo content");
      break;
    case 23:
      result = (NSString *)CFSTR("Scanning iOS update");
      break;
    case 24:
      result = (NSString *)CFSTR("Waiting for demo bundle");
      break;
    case 25:
      goto LABEL_5;
    case 26:
      result = (NSString *)CFSTR("Rebooting to prepare demo");
      break;
    case 27:
      result = (NSString *)CFSTR("Rebooting device");
      break;
    default:
      if (v2 == 100)
        result = (NSString *)CFSTR("Operation completed");
      else
LABEL_5:
        result = (NSString *)CFSTR("Other operations");
      break;
  }
  return result;
}

- (int64_t)stage
{
  return self->_stage;
}

- (void)setStage:(int64_t)a3
{
  self->_stage = a3;
}

- (int64_t)percent
{
  return self->_percent;
}

- (void)setPercent:(int64_t)a3
{
  self->_percent = a3;
}

@end
