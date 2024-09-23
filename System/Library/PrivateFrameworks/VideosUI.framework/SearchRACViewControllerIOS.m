@implementation SearchRACViewControllerIOS

- (_TtC8VideosUI26SearchRACViewControllerIOS)initWithCoder:(id)a3
{
  OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  sub_1D9B5609C();
}

- (void)viewDidLoad
{
  _TtC8VideosUI26SearchRACViewControllerIOS *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B56274();
  OUTLINED_FUNCTION_5_8(v3);
}

- (void)viewDidLayoutSubviews
{
  _TtC8VideosUI26SearchRACViewControllerIOS *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B568AC(v3);
  OUTLINED_FUNCTION_5_8(v4);
}

- (void)doneButtonTapped
{
  _TtC8VideosUI26SearchRACViewControllerIOS *v2;
  void *v3;

  v2 = self;
  OUTLINED_FUNCTION_115_2();
  sub_1D9B569E4();
  OUTLINED_FUNCTION_5_8(v3);
}

- (_TtC8VideosUI26SearchRACViewControllerIOS)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1DA143E80();
  v5 = a4;
  sub_1D9B56F64();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_1D970F43C((uint64_t)self + OBJC_IVAR____TtC8VideosUI26SearchRACViewControllerIOS_selectedOption, &qword_1F0209FF0);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26SearchRACViewControllerIOS____lazy_storage___menuTableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8VideosUI26SearchRACViewControllerIOS____lazy_storage___doneButton));
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  sub_1D9B5705C((uint64_t)self, a4);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  _TtC8VideosUI26SearchRACViewControllerIOS *v10;
  BOOL result;

  length = a4.length;
  location = a4.location;
  sub_1DA143E80();
  v9 = a3;
  v10 = self;
  sub_1D9B570A0(v9, location, length);

  OUTLINED_FUNCTION_54_0();
  OUTLINED_FUNCTION_28_0();
  return result;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v6 = OUTLINED_FUNCTION_34_5((uint64_t)self, (uint64_t)a2, a3);
  v7 = v4;
  sub_1D9B571E8((uint64_t)v7, a4);
  v9 = v8;

  if (v9)
  {
    v10 = (void *)sub_1DA143E50();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;

  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_107_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_1_7();
  v7 = v5;
  OUTLINED_FUNCTION_54_8();
  v8 = (void *)OUTLINED_FUNCTION_34_37();
  sub_1D9B572C4(v8);
  v10 = v9;

  OUTLINED_FUNCTION_13_13();
  return v10;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;

  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_107_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_1_7();
  v7 = v5;
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_34_37();
  v8 = (void *)sub_1D9B573A8();

  OUTLINED_FUNCTION_13_13();
  return v8;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  int64_t result;

  sub_1D9B57B3C();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_107_3();
  MEMORY[0x1E0C80A78](v6);
  OUTLINED_FUNCTION_1_7();
  v7 = v5;
  OUTLINED_FUNCTION_54_8();
  OUTLINED_FUNCTION_34_37();
  sub_1D9B57B74();

  OUTLINED_FUNCTION_13_13();
  OUTLINED_FUNCTION_28_0();
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v4;
  _TtC8VideosUI26SearchRACViewControllerIOS *v5;

  v4 = a3;
  v5 = self;
  sub_1D9B57F4C((uint64_t)v4);

  OUTLINED_FUNCTION_5_8(v5);
}

- (void)textViewDidEndEditing:(id)a3
{
  id v4;
  _TtC8VideosUI26SearchRACViewControllerIOS *v5;

  v4 = a3;
  v5 = self;
  sub_1D9B57FA8(v4);

}

@end
