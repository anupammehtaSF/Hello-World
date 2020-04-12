from subprocess import PIPE,Popen

process = Popen(['ls','---al'], stdout=PIPE,shell=True)

(output, err) = process.communicate()
exit_code = process.wait()

print (output)
