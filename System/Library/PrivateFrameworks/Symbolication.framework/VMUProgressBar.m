@implementation VMUProgressBar

- (void)setTitle:(id)a3 withTotalItems:(unint64_t)a4
{
  id v7;
  NSString *itemName;
  FILE *v9;
  id v10;

  objc_storeStrong((id *)&self->_title, a3);
  v7 = a3;
  itemName = self->_itemName;
  self->_totalItems = a4;
  self->_itemName = 0;

  self->_itemsDone = 0;
  self->_successes = 0;
  self->_color = 0;
  self->_failures = 0;
  v9 = (FILE *)*MEMORY[0x1E0C80C10];
  +[VMUTerminalColorizer controlCodeResetString](VMUTerminalColorizer, "controlCodeResetString");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fprintf(v9, "\n%s%s\n", (const char *)objc_msgSend(v10, "UTF8String"), -[NSString UTF8String](self->_title, "UTF8String"));

}

- (VMUProgressBar)init
{
  VMUProgressBar *v2;
  uint64_t v3;
  NSLock *itemCompletionLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VMUProgressBar;
  v2 = -[VMUProgressBar init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    itemCompletionLock = v2->_itemCompletionLock;
    v2->_itemCompletionLock = (NSLock *)v3;

  }
  return v2;
}

- (void)updateItemName:(id)a3
{
  objc_storeStrong((id *)&self->_itemName, a3);
  -[VMUProgressBar _printProgressBar](self, "_printProgressBar");
}

- (void)itemCompleteWithStatus:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;

  v3 = a3;
  -[NSLock lock](self->_itemCompletionLock, "lock");
  ++self->_itemsDone;
  v5 = 48;
  if (v3)
    v5 = 40;
  ++*(Class *)((char *)&self->super.isa + v5);
  -[VMUProgressBar _printProgressBar](self, "_printProgressBar");
  -[NSLock unlock](self->_itemCompletionLock, "unlock");
}

- (void)colorize:(unsigned int)a3
{
  FILE *v3;
  id v4;

  self->_color = a3;
  v3 = (FILE *)*MEMORY[0x1E0C80C10];
  +[VMUTerminalColorizer startColorCodeString:](VMUTerminalColorizer, "startColorCodeString:", 238);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  fputs((const char *)objc_msgSend(v4, "UTF8String"), v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemCompletionLock, 0);
  objc_storeStrong((id *)&self->_itemName, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
