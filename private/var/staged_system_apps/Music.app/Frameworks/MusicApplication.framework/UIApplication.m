@implementation UIApplication

+ (id)sharePlayTogetherObjCViewModel
{
  return (id)qword_1580A40;
}

+ (void)setSharePlayTogetherObjCViewModel:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)qword_1580A40;
  qword_1580A40 = (uint64_t)a3;
  v4 = a3;

  v5 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v6 = v5;
  if (qword_14ABEE0 != -1)
  {
    swift_once(&qword_14ABEE0, sub_A14064);
    v5 = v6;
  }
  objc_msgSend(v5, "postNotificationName:object:", qword_15817A0, 0);

}

@end
