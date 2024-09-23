@implementation TUAddLocalNSObserver

void __TUAddLocalNSObserver_block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", a1[4], a1[7], a1[5], a1[6]);

}

@end
