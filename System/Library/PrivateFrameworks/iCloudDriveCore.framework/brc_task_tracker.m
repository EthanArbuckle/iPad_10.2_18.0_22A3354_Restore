@implementation brc_task_tracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->group, 0);
}

- (void)dealloc
{
  objc_super v3;

  free(self->label);
  v3.receiver = self;
  v3.super_class = (Class)brc_task_tracker;
  -[brc_task_tracker dealloc](&v3, sel_dealloc);
}

@end
