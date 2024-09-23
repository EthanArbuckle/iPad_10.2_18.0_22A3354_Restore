@implementation CRDNDGeofenceAlert

+ (id)alertForEnteringGeofence:(BOOL)a3
{
  __objc2_class **v3;

  v3 = off_1000B4688;
  if (!a3)
    v3 = &off_1000B4690;
  return (id)objc_opt_new(*v3, a2);
}

- (id)title
{
  -[CRDNDGeofenceAlert doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)message
{
  -[CRDNDGeofenceAlert doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

+ (id)actions
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return &__NSArray0__struct;
}

@end
