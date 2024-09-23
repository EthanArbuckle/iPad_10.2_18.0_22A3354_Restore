@implementation UIApplication

+ (id)sharePlayTogetherObjCViewModel
{
  return (id)qword_10124C7A8;
}

+ (void)setSharePlayTogetherObjCViewModel:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;

  v3 = (void *)qword_10124C7A8;
  qword_10124C7A8 = (uint64_t)a3;
  v4 = a3;

  v5 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  v6 = v5;
  if (qword_10119B898 != -1)
  {
    swift_once(&qword_10119B898, sub_1000A98EC);
    v5 = v6;
  }
  objc_msgSend(v5, "postNotificationName:object:", qword_10124C760, 0);

}

@end
