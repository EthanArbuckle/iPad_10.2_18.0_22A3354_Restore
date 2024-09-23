@implementation UIApplication

+ (id)sharedPlaybackController
{
  return (id)qword_100573010;
}

+ (void)setSharedPlaybackController:(id)a3
{
  id v3;
  id v4;

  v4 = (id)qword_100573010;
  qword_100573010 = (uint64_t)a3;
  v3 = a3;

}

@end
