@implementation REMCDImageAttachment

+ (BOOL)isAbstract
{
  return 0;
}

+ (id)cdEntityName
{
  return +[REMImageAttachment cdEntityName](REMImageAttachment, "cdEntityName");
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("REMCDImageAttachment"));
}

- (id)attachmentRepresentationAndReturnError:(id *)a3
{
  return sub_10041A24C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))sub_10041C678);
}

@end
