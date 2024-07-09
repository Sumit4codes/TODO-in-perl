
sub init()
{   print("\n");
    print("\n");
    print("\n");
    print("\n");
    print("Welocme To The App\n");
    print("--------------------\n");
    print("  Choose an Option\n");
    print("--------------------\n");
    print("1. View the TODO list\n");
    print("2. Add a new TODO\n");
    print("3. Delete a TODO\n");
    print("4. Exit\n");
    $opt=<STDIN>;
    chomp($opt);
    if($opt eq 1)
    {
        if ($listcnt == 0)
        {
            print("--------------------\n");
            print("  TODO List Empty\n");
            print("--------------------\n");
            init();
        }
        else{
                print("\n");
                print("\n");
                print("\n");
                print("\n");
                print("--------------------\n");
                print("--------------------\n");
                print("  The TODO list is:\n");
                print("--------------------\n");
                print("--------------------\n");
                viewlist();
                print("\n");
                print("\n");
                print("\n");
                print("\n");
                init();

        }
    }
    elsif($opt eq 2)
    {
        print("Enter the TODO:\n");
        entertodo();
        init();
        
    }
    elsif($opt eq 3)
    {
        viewlist();
        print("Enter the TODO to delete:\n");
        deletetodo();
        init();
    }
    elsif($opt eq 4)
    {
        print("----------------------------\n");
        print("Thank you for using the app\n");
        print("----------------------------\n");
        exit;
    }
    else{
        print("Invalid option\n");
        init();
    }
}

#Enter the List
sub entertodo()
    {
        $entry=<STDIN>;
        chomp($entry);
        $list{$listcnt + 1} = "$entry";
        print("----------------------------\n");
        print("\n  Task Added Successfully\n");
        print("----------------------------\n");
        $listcnt=$listcnt+1;

    }

sub deletetodo()
{
    $todelete = <STDIN>;
    chomp($todelete);
    if (exists $list{$todelete})
    {
        delete $list{$todelete};
        print("----------------------------\n");
        print("\n  Task Deleted Successfully\n");
        print("----------------------------\n");
        $listcnt= $listcnt-1;
        foreach $keys(keys %list)
        {
            if ($keys > $todelete)
            {
                $list{$keys - 1} = $list{$keys};
                delete $list{$keys};
            }
        }
    }
    else
    {
        print("----------------------------\n");
        print("\n  Task Not Found\n");
        print("----------------------------\n");
    }

}

#View the list
sub viewlist()
    {
        foreach my $key (sort { $a <=> $b } keys %list) {
        print "$key: $list{$key}\n";
}
        
    }

#Global Variables
our $listcnt=0;
our %list=
        {

        };

#Start the Program
init();

