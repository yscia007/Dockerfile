shared_examples 'bootstrap::distribution' do

    #########################
    # CentOS
    #########################

    describe command('cat /etc/redhat-release'), :if => os[:family] == 'redhat' do
        its(:stdout) { should contain('CentOS') }
        its(:stdout) { should contain('Linux release ' + os[:version] + '.') }

        its(:exit_status) { should eq 0 }
    end

    #########################
    # Ubuntu
    #########################

    describe command('cat /etc/dockerimage_lsb'), :if => os[:family] == 'ubuntu' do
        its(:stdout) { should contain("Distributor ID:\tUbuntu") }

        its(:exit_status) { should eq 0 }
    end

    describe command('cat /etc/dockerimage_lsb'), :if => os[:family] == 'debian' do
        its(:stdout) { should contain("Release:\t" + os[:version]) }

        its(:exit_status) { should eq 0 }
    end

    #########################
    # Debian
    #########################

    describe command('cat /etc/dockerimage_lsb'), :if => os[:family] == 'debian' do
        its(:stdout) { should contain("Distributor ID:\tDebian") }

        its(:exit_status) { should eq 0 }
    end


    describe command('cat /etc/dockerimage_lsb'), :if => os[:family] == 'debian' do
        its(:stdout) { should contain("Release:\t" + os[:version] + '.') }

        its(:exit_status) { should eq 0 }
    end

    #########################
    # Alpine
    #########################

    describe command('sed -e "s/^/Release: /" /etc/alpine-release'), :if => os[:family] == 'alpine' do
        its(:stdout) { should contain('Release: ' + os[:version] + '.') }

        its(:exit_status) { should eq 0 }
    end
end
