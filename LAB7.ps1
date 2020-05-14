<#
Powershell Lab 7
Manipulate users,OUs, goups, and group membership
Created by: Emmanuel Johnson
#>

Clear-Host

function Show-Menu
{
    param (
        [string]$Title = 'My Menu'
    )
    clear-host
    write-host "choose from the following Meu Items:"

    Write-Host "A: View one OU 't't't B. View all OUs"
    Write-Host "C: View one group 't't D. View all groups"
    write-host "E: view one user 't't F. view all users"
    write-host "`n"
    write-host "G. Create on OU 't't H. Create one groups"
    write-host "I. Create one user 't't J. Create users from csv file"
    write-host "`n"
    write-host "k. add user to group 't L. Remove user from group"
    write-host "`n"
    write-host "M. Delete one group `t N. Delete one user"
    write-host "`n"
    write-host "Enter anything other than A - N to quit"
}



 

do{
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
   {
         
    
        'A' {
            $OU = read-host "Name of OU"
            Get-ADOrganizationalUnit -LDAPFilter "(name=$OU)" | Format-Table name, distinguishedname
            Read-host "Press enter to continue..."
            }
        'B'{
            Get-ADOrganizationalUnit -Filter "*" | Format-Table name, distinguishedname
            Read-Host "Press ENter to continue..."
            }
        'C'{
            $Group = Read-Host "Name of Group" 
            Get-ADGroup -LDAPFilter "(name=$Group*)" | Format-Table name, groupscope, groupcategory
            read-host "press Enter to continue..."
            }
        'D'{
            Get-ADGroup -Filter "*" |Format-Table name,groupscpe, groupcategory
            Read-Host "Press Neter to continue..."
            }
        'E' {
            $User = Read-host "Name of user"
            Get-ADUser -LDAPFilter "(name=$user*)" | Format-Table name, distingueshedname
            Read-Host "Press ENter to Continue..."
            }
        'F'{
            Get-ADGroup -Filter "*" | Format-Table name, ditingueshedname, firstname, lastname
            read-host "press Enter to continue"
            } 
        'G'{
           $_OU2 = read-host "Name of OU to create"
           New-ADOrganizationalUnit -Name "$_OU2" -path "DC=adtum, DC=com"
           Get-ADOrganizationalUnit -LDAPFilter "(name=$_OU2*)" | Format-Table name,distingueshedname
           Read-Host "Press ENter to continue"
           }
        'H'{
            $_group2 = Read-Host "name of Group to create"
            New-ADGroup "$_group2"-GroupCategory Security -GroupScope Global -path "CN=Users, DC=adatum, DC=com"
            Get-ADGroup -LDAPFilter"(name=$_Group2*)" | Format-Table name, groupscope, groupcategory
            Read-host "Press Enter to continue..."
            }
        'I'{
            $name = Read-Host "Name?"
            $pass = Read-Host "$Name's password?"
            $password = ConvertTo-SecureString -string $pass -AsPlainText -Force
            $first = Read-host "$Name's first name?"
            $last = Read-host "$name's last name?"
            $city = Read-Host "$name's city?"
            $state =read-host "$name's state?"
            $zipcode = Read-Host "$name's zipcode?"
            $company = read-host "$name's company?"
            $division = read-host "$name's division?"
            $userparams = @{Name = $name;
                               samAccountName = $name;
                               UserPrincipleName = $name;
                               givenname = $first;
                               Surname = $last;
                               city = $city;
                               state = $state;
             }
        
        }
        
        }
        } 
        until ($selection -ne "a,b,c,d,e,f,g,h,i,j,k,l,m,n" )

 
 
            
       