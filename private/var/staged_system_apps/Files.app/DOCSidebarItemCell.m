@implementation DOCSidebarItemCell

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[DOCSidebarItemCell endEditing:](self, "endEditing:", 1);
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4;
  _TtC5Files18DOCSidebarItemCell *v5;

  v4 = a3;
  v5 = self;
  sub_100399EDC();

}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4;
  _TtC5Files18DOCSidebarItemCell *v5;

  v4 = a3;
  v5 = self;
  sub_10039869C(v4);

}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  uint64_t Strong;
  char v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + qword_100651090, a2);
  if (!Strong)
    return 0;
  if (*(_QWORD *)((char *)self + qword_1006510B0) || (*((_BYTE *)self + qword_100651098) & 1) != 0)
    v5 = 1;
  else
    v5 = *((_BYTE *)self + qword_1006510A0);
  swift_unknownObjectRelease(Strong);
  return v5;
}

- (void)ejectionStateDidChange
{
  _TtC5Files18DOCSidebarItemCell *v2;

  v2 = self;
  sub_100396B48();

}

@end
