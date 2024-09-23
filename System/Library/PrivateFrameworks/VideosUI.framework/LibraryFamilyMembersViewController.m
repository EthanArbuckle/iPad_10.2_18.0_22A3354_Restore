@implementation LibraryFamilyMembersViewController

- (UINavigationItem)navigationItem
{
  _TtC8VideosUI34LibraryFamilyMembersViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_1D9C09A5C();

  return (UINavigationItem *)v3;
}

- (_TtC8VideosUI34LibraryFamilyMembersViewController)init
{
  return (_TtC8VideosUI34LibraryFamilyMembersViewController *)sub_1D9C09A88();
}

- (_TtC8VideosUI34LibraryFamilyMembersViewController)initWithCoder:(id)a3
{
  sub_1D9C09B90();
}

- (void)vui_viewDidLoad
{
  _TtC8VideosUI34LibraryFamilyMembersViewController *v2;

  v2 = self;
  sub_1D9C09BF4();
  OUTLINED_FUNCTION_5_8(v2);
}

- (void)vui_viewDidLayoutSubviews
{
  _TtC8VideosUI34LibraryFamilyMembersViewController *v2;

  v2 = self;
  sub_1D9C09CE0();
  OUTLINED_FUNCTION_5_8(v2);
}

- (_TtC8VideosUI34LibraryFamilyMembersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9C09DE8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI34LibraryFamilyMembersViewController_familyController));
}

- (void)familyMemberViewController:(id)a3 didSelectFamilyMember:(id)a4
{
  id v6;
  id v7;
  _TtC8VideosUI34LibraryFamilyMembersViewController *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1D9C09E74((uint64_t)v6, v7);

  OUTLINED_FUNCTION_4_3(v8);
}

@end
